## 🔮 Adivinador: 
Se desea tener un programa que calcule el saldo de una cuenta. Supón que los datos son leídos de la entrada estándar y que constan de renglones, cada uno de los cuales contiene una letra seguida de un valor real separado por un espacio. El último renglón contiene únicamente la letra X en la columna uno.
El primer renglón contiene la letra A y el saldo inicial de una cuenta de cheques. Los demás renglones contienen la letra D y el importe de un depósito o la letra R y el importe de un retiro. Escribe un programa en Pascal que determine el saldo exacto de la cuenta después de procesar las transacciones.

    A 1200.35
    D 64.12
    R 390.00
    R 289.67
    D 13.02
    R 51.07
    X
    El saldo final es 546.75

### 📝 El programa:
Escribe un programa en Pascal que dado un fragmento de texto que debe ser leído de la entrada estándar, todo en una línea, y terminado por el caracter $, determine y exhiba las letras que aparecen duplicadas en forma contigua.
Por ejemplo, en el texto `llama al chico que lee$` aparece repetida de forma contigua la l (ll) y la e (ee). La salida debe ser ll ee.
Otro ejemplo: l`lueve todos los ddias y aaron tiene mal humor$` 
Salida: `ll dd aa`
Se asume que el usuario solo escribe letras minúsculas, que hay un solo espacio entre una palabra y otra y que el siempre se ingresa el símbolo $ al final. Si esto no fuera así el programa se complicaría mucho.
Escribe un programa que realice las funciones de una calculadora simple. Los datos de entrada serán una secuencia de números enteros decimales (solo números de una cifra) y los operadores +, *, / y -, seguida de un signo =. Por ejemplo:

`5 + 9 – 8 * 7 =
`
El usuario puede usar más de un espacio para separar números y símbolos. El programa debe poder leer los números y símbolos omitiendo los espacios. Se asume que al menos hay un espacio entre operadores y números. Los operadores se aplican en el orden en que aparecen en los datos de entrada. Por ejemplo, en el caso anterior, normalmente se haría la multiplicación primero y luego las demás operaciones, lo cual daría como resultado -42, pero el programa que se pide hacer no tomará eso en cuenta y hará las cuentas tal como son ingresadas. En el ejemplo anterior sería: 5+9 que da 14, luego se le resta 8 que da 6, y eso se multiplica por 7, que da 42.
El usuario ingresará solo números enteros y se producirán resultados enteros, o sea, si bien se ingresa el operador de la división con el símbolo /, el comportamiento es el de DIV. Asume que al menos se ingresa una operación y el signo de igual al final.

Ej. de entrada: `4 + 3 / 2 * 8 - 4 =`
Ej. de salida: `20`

### 📚 Bibliografia:
- https://www.udemy.com/course/programacion-profesional-desde-cero
