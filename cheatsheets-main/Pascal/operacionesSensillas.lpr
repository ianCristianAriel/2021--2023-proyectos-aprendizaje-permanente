program operacionesSensillas;
 var valor1, valor2, suma, resta, multiplicacion, divicion, promedio: real;
begin
  Write('Ingresa un valor: ');
  readln(valor1);

  write('Ingresa el otro valor: ');
  readln(valor2);

  suma:= valor1+valor2;
  resta:=valor1-valor2;
  multiplicacion:= valor1*valor2;
  divicion:= valor1/valor2;
  promedio:= (valor1+valor2)/2;

  writeln('Suma= ',suma:4:2);
  writeln('Resta= ',resta:4:2);
  writeln('multiplicacion= ',multiplicacion:4:2);
  writeln('Divicion= ',divicion:4:2);
  writeln('Promedio= ',promedio:4:2);

  readln;
end.

