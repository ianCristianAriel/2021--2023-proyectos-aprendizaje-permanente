program triangulo_var_real;
var base, altura, area: real;
begin
  write('Ingresa el altura del triangulo: ');
  readln(altura);
  write('Ingresa la base del triangulo: ');
  readln(base);

  area:=base*altura /2;
  writeln('El area del triangulo es: ',area:4:2);
  readln;
end.

