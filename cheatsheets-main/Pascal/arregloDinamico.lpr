program arregloDinamico;

var   palabra: array of char;
      letra: char;
      i, contador, dimension: byte;
begin
  contador:=0;
  dimension:=0;

  write('De cuantas letras quieres que sea tu palabra: ');
  readln(dimension);

  SetLength(palabra,dimension);

  write('Ingresa una palabra de ',dimension,' letras: ');
  for i:=Low(palabra) to High(palabra) do begin
    read(palabra[i]);
    end;
  readln;

  write('Ingresa una letra: ');
  readln(letra);
  for i:=Low(palabra) to  High(palabra) do begin
  if palabra[i]=letra then begin
  contador+=1;
  end;
end;

  write('La letra "',letra,'" se repite ',contador,' veces.');

  readln;
end.

