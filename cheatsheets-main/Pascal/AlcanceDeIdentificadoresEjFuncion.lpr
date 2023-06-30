program AlcanceDeIdentificadoresEjFuncion;
var area, largo, ancho, suma: integer;
  {Si bien los parametros a definir en la cuncion tienen el mismo nmbre que las vareables globales, dentro del subprograma (en este caso la funcion) tienen prioridad las locales (las cuales se les asigna un valor que se destruye una ves termina)}
function areaRec(largo, ancho: integer): integer;
begin
//Valor que se le asigna a la funcion al resivir los valores de largo y ancho globales
result:= largo*ancho;
//Largo y ancho locales
largo:=5;
ancho:=4;
Writeln('Largo local: ',largo,' Ancho local: ',ancho);
//Area local
Area:=largo*ancho;
writeln('Area local: ',area);
{Dentro de del codigo local se pueden llamar a variables globales y utilizarlas dandole valores desde el subprograma}
suma:=largo+ancho+area;
writeln('Suma de locales: ',suma);
end;
begin
  readln(largo, ancho);
  writeln('Largo global: ',largo,' Ancho global: ',ancho);
  //Area Global: lee la entrada y invoca a la funcion enviandole los dos valores leidos
  area:=areaRec(largo,ancho);
  writeln('Area Global: ', area);
  {Esta variable "suma" que tambien se define mientras se ejecuta la funcion tambien se puede utilizar y definir en el codigo global una vez que termino la funcion y se destruyeron sus valores}
  suma:=largo+ancho+area;
  writeln('Suma de globales: ',suma);

  readln;

end.

