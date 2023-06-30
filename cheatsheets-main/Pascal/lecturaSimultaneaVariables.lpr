program lecturaSimultaneaVariables;
var numero: integer;
    caracter: char;
    palabra: string;

begin
  Write('Ingresa tu edad y tu nombre separados por un espacio: ');
  readln(numero,caracter,palabra);
  write(palabra+' tienes ',numero,' aNios..');

  readln;
end.

