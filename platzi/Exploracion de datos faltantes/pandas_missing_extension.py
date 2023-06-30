#Importacion de librerias
import itertools
import pandas as pd
import upsetplot
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np


try:
    del pd.DataFrame.missing
except AttributeError:
    pass

#Se amplia las funcionalidades de pandas Dataframe
#A estas funcionalidades se accedera con .missing
@pd.api.extensions.register_dataframe_accessor("missing")
class MissingMethods:
    def __init__(self, pandas_obj):
        #El dataframe sera accesdido en toda la clase como ._obj
        self._obj = pandas_obj
        
    # metodo para enconctrar el numero de registros con valores faltantes
    def number_missing(self) -> int:
        return self._obj.isna().sum().sum()
    
    #Este metodo retorna los registros sin valores faltantes
    #Resta al tamaño del dataframe, el tamaño o cantidad de registros con valores faltantes
    def number_complete(self) -> int:
        return self._obj.size - self._obj.missing.number_missing()

    #Entrega un dataframe con la suma de valores faltantes por vriable/columna
    def missing_variable_summary(self) -> pd.DataFrame:
        #se pasa el dataframe a la funcion lambda
        return self._obj.isnull().pipe(
            lambda df_1: (
                # dentro del dataframe pasado, hace la suma de los valores por columna
                df_1.sum()
                #Se coloca la columna que representa los valores faltantes por variable como "n_missing"
                .reset_index(name="n_missing")
                #Se establecen dos columnas "index" y "variable"
                .rename(columns={"index": "variable"})
                # calcula el porcentaje de valores faltantes para cada variable 
                .assign(
                    n_cases=len(df_1),
                    pct_missing=lambda df_2: df_2.n_missing / df_2.n_cases * 100,
                )
            )
        )


    def missing_case_summary(self) -> pd.DataFrame:
        #Agrega nuevas columnas al dataframe
        return self._obj.assign(
            #contiene los índices (etiquetas) de las filas del DataFrame.
            case=lambda df: df.index,
            #Devuelve el numero de valores faltantes por fila
            n_missing=lambda df: df.apply(
                axis="columns", func=lambda row: row.isna().sum()
            ),
            #crea una nueva columna "pct_missing" que calcula el porcentaje de valores faltantes en cada fila
            #Divide el número de valores faltantes (df["n_missing"]) por el número total de columnas (df.shape[1]) y luego multiplica por 100.
            pct_missing=lambda df: df["n_missing"] / df.shape[1] * 100,
        #se utiliza la indexación [["case", "n_missing", "pct_missing"]] para seleccionar solo las columnas "case", "n_missing" y "pct_missing" 
        # del DataFrame resultante.
        )[["case", "n_missing", "pct_missing"]]

    def missing_variable_table(self) -> pd.DataFrame:
        return (
            #Llama al metodo que retorna un dataframe con 3 columnas [["case", "n_missing", "pct_missing"]]: 
            self._obj.missing.missing_variable_summary()
            #Retorna una serie con la cantidad de veces que aparece cada valor en la columna "n_missing"
            .value_counts("n_missing")
            #restablece el índice de la serie generada en el paso anterior para convertirla en un DataFrame.
            .reset_index()
            #La columna "n_missing" se renombra como "n_missing_in_variable" 
            #la columna generada en el paso anterior se renombra como "n_variables", que representa la cantidad de variables 
            #correspondientes a cada cantidad de valores faltantes.
            .rename(columns={"n_missing": "n_missing_in_variable", "index" : "n_variables"})
            .assign(
                #agrega una nueva columna al DataFrame resultante llamada "pct_variables" que calcula el porcentaje de 
                # variables en cada cantidad de valores faltantes. 
                pct_variables=lambda df: df.n_variables / df.n_variables.sum() * 100
            )
            #ordena el DataFrame resultante en orden descendente según el porcentaje de variables en cada cantidad de valores faltantes. 
            .sort_values("pct_variables", ascending=False)
        )

    def missing_case_table(self) -> pd.DataFrame():
        return (
            #Recive un dataframe con [["case", "n_missing", "pct_missing"]]
            self._obj.missing.missing_case_summary()
            #Retorna una serie con la cantidad de veces que aparece cada valor en la columna "n_missing" 
            .value_counts("n_missing")
            #Resetea el indice
            .reset_index()
            #Renombra las columnas"n_missing" como "n_missing_in_case"
            #el indice como "n_cases"
            .rename(columns={"n_missing": "n_missing_in_case", "index" : "n_cases"})
            .assign(pct_case=lambda df: df.n_cases / df.n_cases.sum() * 100)
            .sort_values("pct_case", ascending=False)
        )

    def missing_variable_span(self, variable: str, span_every: int) -> pd.DataFrame:
        return (
            self._obj.assign(
                #agrega una nueva columna "span_counter" al DataFrame, que se utiliza para asignar un contador a cada fila. 
                span_counter=lambda df: (
                    # El contador se repite cada span_every filas, utilizando la función np.repeat(). 
                    # El tamaño del contador se ajusta a la longitud del DataFrame original utilizando [: df.shape[0]].
                    np.repeat(a=range(df.shape[0]), repeats=span_every)[: df.shape[0]]
                )
            )
            #agrupa el DataFrame por el contador "span_counter".
            .groupby("span_counter")
            .aggregate(
                n_in_span=(variable, "size"),
                n_missing=(variable, lambda s: s.isnull().sum()),
            )
            .assign(
                #Calcula la cantidad de valores completos en cada grupo (n_complete)
                n_complete=lambda df: df.n_in_span - df.n_missing,
                #el porcentaje de valores faltantes en cada grupo (pct_missing)
                pct_missing=lambda df: df.n_missing / df.n_in_span * 100,
                #el porcentaje de valores completos en cada grupo (pct_complete).
                pct_complete=lambda df: 100 - df.pct_missing,
            )
            #elimina la columna "n_in_span" del DataFrame resultante.
            .drop(columns=["n_in_span"])
            #Se resetea el indice
            .reset_index()
        )

    def missing_variable_run(self, variable) -> pd.DataFrame:
        # Calcula las secuencias de valores nulos y no nulos y almacena dentr de la lista"rle_list" con la longitud de cada secuencia y su 
        # tipo (nulo o no nulo)
        rle_list = self._obj[variable].pipe(
            lambda s: [[len(list(g)), k] for k, g in itertools.groupby(s.isnull())]
        ) 
        #data es la lista generada en el paso anterior y columns especifica los nombres de las columnas del DataFrame.
        return pd.DataFrame(data=rle_list, columns=["run_length", "is_na"]).replace(
            #Los valores False se reemplazan por "complete" y los valores True se reemplazan por "missing".
            {False: "complete", True: "missing"}
        )

    #el orden de clasificación será descendente (de mayor a menor cantidad de valores faltantes).
    def sort_variables_by_missingness(self, ascending = False):

        return (
            self._obj
            .pipe(
                lambda df: (
                    # devuelve una Serie de pandas donde los índices son las columnas del DataFrame y los valores son la cantidad 
                    # de valores faltantes para cada columna.
                    df[df.isna().sum().sort_values(ascending = ascending).index]
                )
            )
        )

    def create_shadow_matrix(
        #Toma tres parámetros opcionales: true_string, false_string y only_missing
        self,
        true_string: str = "Missing",#cadena de texto que se utilizará para representar los valores faltantes
        false_string: str = "Not Missing",#cadena de texto que se utilizará para representar los valores no faltantes
        only_missing: bool = False,#determina si la matriz de sombra debe contener solo valores faltantes o si debe contener todas las columnas del DataFrame 
    ) -> pd.DataFrame:
        return (
            self._obj
            #matriz booleana que indica qué valores del DataFrame original son faltantes (True) y cuáles no (False).
            .isna() 
            #devuelve una Serie booleana que indica qué columnas tienen al menos un valor True.
            .pipe(lambda df: df[df.columns[df.any()]] if only_missing else df)
            #Los valores False se reemplazan por false_string y los valores True se reemplazan por true_string.
            .replace({False: false_string, True: true_string})
            #agregar el sufijo "_NA" a los nombres de columna en la matriz de sombra
            .add_suffix("_NA")
        )#devuelve el DataFrame resultante

    #Lo mismo que la anterior, solo que ademas de devolver el dataframe con la matriz de sombra, devuelve la union con el dataframe original
    def bind_shadow_matrix(
        self,
        true_string: str = "Missing",
        false_string: str = "Not Missing",
        only_missing: bool = False,
    ) -> pd.DataFrame:
        return pd.concat(
            objs=[
                self._obj,
                self._obj.missing.create_shadow_matrix(
                    true_string=true_string,
                    false_string=false_string,
                    only_missing=only_missing
                )
            ],
            axis="columns"
        )

    def missing_scan_count(self, search) -> pd.DataFrame:
        return (
            self._obj.apply(axis="rows", func=lambda column: column.isin(search))
            .sum()
            .reset_index()
            .rename(columns={"index": "variable", 0: "n"})
            .assign(original_type=self._obj.dtypes.reset_index()[0])
        )

    # Plotting functions ---

    def missing_variable_plot(self):
        #Obtiene un resumen de la cantidad de valores faltantes por variable utilizando el método missing_variable_summary 
        #Ordena el DataFrame resultante por la columna "n_missing", que representa la cantidad de valores faltantes.
        df = self._obj.missing.missing_variable_summary().sort_values("n_missing")
        #Define un rango de valores plot_range que se utilizará para etiquetar el eje y del gráfico. 
        # Este rango se genera desde 1 hasta el número de filas en el DataFram
        plot_range = range(1, len(df.index) + 1)
        #La posición vertical de cada línea corresponde a los valores en plot_range,
        #mientras que la posición horizontal está determinada por la cantidad de valores faltantes en cada variable
        plt.hlines(y=plot_range, xmin=0, xmax=df.n_missing, color="black")
        #Utiliza plt.plot para trazar puntos en el gráfico. 
        #Los puntos representan la cantidad de valores faltantes en cada variable y su posición vertical está determinada por los valores en plot_range
        plt.plot(df.n_missing, plot_range, "o", color="black")
        #Utiliza plt.yticks para etiquetar el eje y del gráfico con los nombres de las variables. 
        plt.yticks(plot_range, df.variable)

        plt.grid(axis="y")
        #Agrega etiquetas a los ejes x e y del gráfico utilizando plt.xlabel y plt.ylabe
        plt.xlabel("Number missing")
        plt.ylabel("Variable")

    def missing_case_plot(self):
        #Utiliza el dataframe retornado por el metodo "missing_case_summary"
        df = self._obj.missing.missing_case_summary()
        #Se utiliza el dataframe para graficar los valores faltantes sobre el elje x 
        sns.displot(data=df, x="n_missing", binwidth=1, color="black")

        plt.grid(axis="x")
        #Se etiqueta el eje x como valores faltantes
        plt.xlabel("Number of missings in case")
        #Se etiqueta el eje y con cantidad de valores faltantes
        plt.ylabel("Number of cases")

    #EPermite visualizar patrones de valores faltantes y completos en relación con el intervalo repetitivo.
    def missing_variable_span_plot(
        #"Variable" es una cadena que especifica la variable del DataFrame para la cual se generará el gráfico.
        #"span_every" es un entero que indica la longitud del span o intervalo repetitivo en el DataFrame.
        #"rot" es un entero que indica la longitud del span o intervalo repetitivo en el DataFrame.
        self, variable: str, span_every: int, rot: int = 0, figsize=None
    ):

        (   #Utiliza el DataFrame que contiene el porcentaje de valores faltantes y completos en la variable especificada a lo largo del span.
            self._obj.missing.missing_variable_span(
                variable=variable, span_every=span_every
            ).plot.bar(
                #Utiliza el método plot.bar para generar el gráfico de barras. El parámetro x se establece en "span_counter", que representa el número de span. 
                x="span_counter",
                # El parámetro y se establece en una lista de columnas ["pct_missing", "pct_complete"], que representan los porcentajes de valores faltantes y completos respectivamente.
                y=["pct_missing", "pct_complete"],
                stacked=True,
                width=1,
                color=["black", "lightgray"],
                rot=rot,
                figsize=figsize,
            )
        )
        #Agrega etiquetas al eje x e y del gráfico utilizando plt.xlabel y plt.ylabel.
        plt.xlabel("Span number")
        plt.ylabel("Percentage missing")
        #Agrega una leyenda al gráfico utilizando plt.legend.
        plt.legend(["Missing", "Present"])
        #Agrega un titulo al grafico
        plt.title(
            f"Percentage of missing values\nOver a repeating span of { span_every } ",
            loc="left",
        )
        plt.grid(False)
        #Ajusta el margen a 0
        plt.margins(0)
        plt.tight_layout(pad=0)
        
    #gráfico de tipo "upset plot" que muestra la intersección de los valores faltantes entre múltiples variables en el DataFrame
    #Toma un parámetro opcional variables, que es una lista de cadenas que especifica las variables del DataFrame para las cuales se generará el gráfico
    def missing_upsetplot(self, variables: list[str] = None, **kwargs):
        #Verifica si se ha proporcionado una lista de variables. Si no se ha proporcionado, 
        # se obtienen todas las columnas del DataFrame utilizando self._obj.columns.tolist().
        if variables is None:
            variables = self._obj.columns.tolist()

        return (
            self._obj.isna()
            #Utiliza value_counts para contar la cantidad de combinaciones de valores faltantes y no faltantes para las variables especificadas. 
            # Esto crea un DataFrame que muestra el recuento de cada combinación.
            .value_counts(variables)
            #Utiliza pipe y la función lambda para pasar el DataFrame resultante al método upsetplot.plot para generar el gráfico de tipo "upset plot". 
            .pipe(lambda df: upsetplot.plot(df, **kwargs))
        )
    
# ****** Primera funcion *******
    def column_fill_with_dummies(
        column: pd.Series,
        proportion_below: float=0.10,
        jitter: float=0.075,
        seed: int=42
    ) -> pd.Series:

        column = column.copy(deep=True)

        # Extract values metadata.
        missing_mask = column.isna()
        number_missing_values = missing_mask.sum()
        column_range = column.max() - column.min()

        # Shift data
        column_shift = column.min() - column.min() * proportion_below

        # Create the "jitter" (noise) to be added around the points.
        np.random.seed(seed)
        column_jitter = (np.random.rand(number_missing_values) - 2) * column_range * jitter

        # Save new dummy data.
        column[missing_mask] = column_shift + column_jitter

        return column
        
# ****** Segunda funcion *******
    #muestra la relación entre dos variables y resalta los puntos donde ambos valores son faltantes (missing).
    #variable_a y variable_b, que son cadenas que especifican las dos variables del DataFrame que se utilizarán para generar el gráfico.
    def missing_bivariable_plot(self, variable_a: str, variable_b: str):
        
        #agregar una matriz de sombra (shadow matrix) al DataFrame, donde los valores faltantes se representan 
        # con True y los valores no faltantes se representan con False
        df = self._obj.missing.bind_shadow_matrix(true_string=True, false_string=False)   
        #rellenar las columnas variable_a y variable_b en el DataFrame con valores dummy. 
        df[variable_a] = column_fill_with_dummies(self._obj[variable_a])
        df[variable_b] = column_fill_with_dummies(self._obj[variable_b])
        #Crea una nueva columna llamada "nullity" en el DataFrame, que indica si tanto variable_a como variable_b son faltantes. 
        df['nullity'] = df[f"{variable_a}_NA"] | df[f"{variable_b}_NA"]
        
        return (
        
            sns.scatterplot(
                data=df,
                x=variable_a,
                y=variable_b,
                hue="nullity"
            )
        
        )