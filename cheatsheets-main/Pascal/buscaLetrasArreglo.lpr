program buscaLetrasArreglo;
const max_letras=10;
var palabra: array[1..max_letras]of char;
    letra: char;
    i, contador: byte;
    si: boolean;
begin
 contador:=0;
 si:= false;

 write('Ingresa una palabra de 10 letras: ');
  for i:=1 to max_letras do begin
    read(palabra[i]);
  end;
 readln;

 write('Ingresa una letra; ');
 readln(letra);
 for i:=1 to max_letras do begin
   if palabra[i]=letra then begin
   write('La letra "',letra,'" se encuentra en la columna "',i,'".');
   si:=true;
   contador+=1;
   end;
 end;
 if not si then begin
 writeln('No se encuentra la letra "',letra,'" en la palabra "',palabra,'".');
 writeln;
 end;

 if si then begin
 write('La letra "',letra,'" se repite: ',contador,' veces dentro de "',palabra,'".');
end;

 readln;
end.

