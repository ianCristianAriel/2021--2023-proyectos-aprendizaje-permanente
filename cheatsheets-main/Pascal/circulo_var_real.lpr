program circulo_var_real;
var area, perimetro, radio: real;
  const pi= 3.14;
begin
  write('Ingresa el radio de la circunferencia: ');
  readln(radio);

  perimetro:=radio*2*pi;
  area:= radio*radio*pi;

  writeln('El perimetro de la circunferencia es: ',perimetro:4:2);
  writeln('El area de la circunferencia es: ',area:4:2);
  readln;
end.

