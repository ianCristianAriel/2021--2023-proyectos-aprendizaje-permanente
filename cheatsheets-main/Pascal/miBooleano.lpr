program miBooleano;
var edad: byte;
    condicion: boolean;
begin
  write('Ingresa tu edad: ');
  readln(edad);

  condicion:= edad<= 40;
  if condicion then begin
    write('Estas en una buena etapa');
    end
  else begin
    write('Estas despues de los 40');
  end;
  readln;
end.

