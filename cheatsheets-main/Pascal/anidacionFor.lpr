program anidacionFor;
var i, numeroI, numeroF: byte;
begin
  Write('Ingresa el numero inicial del rango: ');
  readln(numeroI);

  write('Ingresa el numero final del rango: ');
  readln(numeroF);

  for I:= numeroI to numeroF do begin
    if (i mod 2)=0 then begin
    write(i,' ');
    end;
  end;

  readln;
end.

