program AzarFuncionesYProcedimientos;
const max_numero=1000;
type TArregloNumerico=array[1..100] of integer;
var numeros:TArregloNumerico;
{Verifica que el numero n exista en el arreglo desde la posicion i hasta la posicion f. Devuelve TRUE en caso afirmativo o FALSE en caso negativo}
function existeNumero(arreglo: TarregloNumerico; n: integer; i, f: byte): boolean;
var indice: byte;
begin
  for indice:= i to f do begin
    if arreglo[indice]=n then begin
       result:=true;
       exit;
    end;
  end;
  result:=false;
end;

{Se generan al azar numeros que seran agregados al arreglo si son distintos}
procedure generarAlAzar (var arreglo:TArregloNumerico);
  var i, j:byte;
      PosibleNumero: integer;
  begin
    for i:=1 to 100 do begin
      PosibleNumero:= random(max_numero)+1;
      j:=1;
      while existeNumero(arreglo,posibleNumero,1,i-1) do begin //Se invoca a existeNumero pra comprobar que sea un numero
           posiblenumero:=random(Max_Numero)+1;
      end;
      arreglo[i]:=posibleNumero;
    end;
  end;
 procedure imprimirArreglo(arreglo: TArregloNumerico);
 var i:byte;
begin
  for i:=1 to 100 do begin
    write(arreglo[i],' ');
  end;
end;

begin
  generarAlAzar(numeros);
  imprimirArreglo(numeros);

  readln;
 end.
