program arreglo_bidimensional;
type arregloBi= array [1..3,1..5] of byte;
  var a: arregloBi;
      fila, columna: byte;
begin
  randomize;
  for fila:=1 to 3 do begin
    for columna:=1 to 5 do begin
    a[fila,columna]:= random(10);
    end;
   end;

  for fila:=1 to 3 do begin
    for columna:=1 to 5 do begin
    write(a[fila,columna]);
    end;
    writeln;
  end;

  readln;
end.

