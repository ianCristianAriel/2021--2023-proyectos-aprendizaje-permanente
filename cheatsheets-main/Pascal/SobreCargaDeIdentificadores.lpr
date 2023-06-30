program SobreCargaDeIdentificadores;
var n: integer;
    p: real;

{Se conoce como sobre carga al hecho de utilizar funciones y procedimientos con el mismo identificador pero con diferentes firmas (distimtos metodos, parametros y distintos orden en los mismos, distinto tipo de datos, etc.)}
function perimetroRectangulo(largo, ancho: integer):integer;

begin {A lo que hay entre begin y end se le conoce como metodo}
result:=largo*2+ancho*2;
end;

function perimetroRectangulo(largo, ancho: real):real;

begin
result:=largo*2+ancho*2;
end;

procedure perimetroRectangulo(var perimetro:real);
var largo, ancho: real;{Al escrivir las variables debajo, estas se pueden leer desde la entrada standar}

begin
 readln(largo, ancho);
 perimetro:=largo*2+ancho*2;
end;

begin
  n:=perimetroRectangulo(5,10);
  p:=perimetroRectangulo(5.0,10.0);
  writeln(n);
  write(p);
  readln;
end.

