program cuadradoOpciones;
var lado, area, perimetro: real;
begin
  write('Ingresa el lado del cuadrado: ');
  readln(lado);
  area:=lado*lado;
  perimetro:=lado*4;

  if lado<=0 then begin
    write('Error, ingresa un valor mayor a "0"..');
    end else begin
    writeln('El area es: ',area:4:2,#13#10+'El perimetro es: ',perimetro:4:2);
    end;
    readln;
end.

