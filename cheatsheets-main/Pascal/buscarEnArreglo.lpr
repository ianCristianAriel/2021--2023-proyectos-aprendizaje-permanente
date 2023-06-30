program buscarEnArreglo;
type miArreglo= array [1..10] of byte;
  var numeros: miArreglo;
      numero, i: byte;

begin

write('Ingresa un numero entre 1 y 10: ');
readln(numero);

randomize;
 for i:=1 to 10 do begin
   numeros[i]:= random(10);
   if numeros[i]=numero then begin
     writeln('El nunmero ',numero,' se encuetra en la casilla ',i,'.');
   end;
   end;
 for i:=1 to 10 do begin
   write(numeros[i],' ');
 end;

 readln;
 end.


