program Rectangulo;
var perimetro,largo, ancho, area: integer;
begin
  write('ingresa el ancho del rectangulo: ');
  readln(ancho);

  write('ingresa el largo del rectangulo: ');
  readln(largo);

  area:= ancho*largo;
  perimetro:=largo*2 + ancho*2;

  Writeln('El area es ',area);
  writeln('El perimetro es ',perimetro);

  readln;
end.

