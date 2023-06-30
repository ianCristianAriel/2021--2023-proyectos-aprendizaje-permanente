program divicionEntera;
var numero, c1, c2, c3, c4: integer;
begin
  write('Ingresa un numero de cuatro cifras: ');
  readln(numero);

  c4:= numero mod 10;
  c3:= numero mod 100 div 10;
  c2:= numero mod 1000 div 100;
  c1:= numero div 1000;

  writeln('El resultado de sumar: ',c1,'+',c2,'+',c3,'+',c4,' es.. ',c1+c2+c3+c4);
  readln;
end.

