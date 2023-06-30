program numerosSinRepetir;
const max_intentos=10;
type numeros= array[1..10] of byte;
var  arreglo: numeros;
     numero, i, j, contador: byte;

begin
  contador:=0;

  write('Se ingresaran numeros al asar..');

  randomize;
  for i:=1 to max_intentos do begin
  numero:= random(10);

  j:=1;
  while j<i do begin
  if numero=arreglo[j] then begin
  contador+=1;
  j:=1;
  numero:= random(10);
  end else
  j+=1;
  end;

  arreglo[i]:= numero;
end;

  for i:=1 to max_intentos do begin
  write(arreglo[i],' ');
  end;

  writeln;
  write('El codigo se repitio: ',contador,' veces para reelegir numero');
  readln;
end.

