program Parametros;
var edad, cantidad: byte;
    nombre, apellido, ocupacion: string;
    divisor: char;
procedure imprimirAsteriscos01();
var i:byte;
    begin
      for i:=1 to 50 do begin
        write('#');
      end;
      writeln;
    end;

procedure ImprimirAsteriscos(caracter: char; cantidad: byte);
var i:byte;
 begin
   for i:=1 to cantidad do begin
     write(caracter);
   end;
   writeln;
 end;

begin
  {Se puede utilizar como parametro variables del codigo principal}
  write('Ingresa un divisor:');readln(divisor);
  write('Ingresa la cantidad:');readln(cantidad);

  {Las variables a utilizar como parametro se detectan automaticamente por orden y tipo de dato}
  imprimirAsteriscos(divisor, cantidad);
  writeln('         '+'Aprendiendo subprogramas');
  ImprimirAsteriscos('*', 45);
  write('Ingresa tu nombre: ');
  readln(nombre);

  write('Ingresa tu apellido: ');
  readln(apellido);

  write('Ingresa tu edad: ');
  readln(edad);

  write('Ingresa tu ocupacion: ');
  readln(ocupacion);

  {Se pueden utilizar como parametro datos asignados individualmente}
  ImprimirAsteriscos('*', 45);

  writeln;

  imprimirAsteriscos('-', 42);
  Writeln('         Ficha de '+nombre+' '+apellido);
  {Se puede utilizar como parametro lo predefinido en el procedimiento}
  ImprimirAsteriscos01();//Procedimiento creado para ejemplificar

  writeln('Nombre: '+nombre);
  writeln('Apellido: '+apellido);
  writeln('Edad: ',edad);
  writeln('Ocupacion: '+ocupacion);

  imprimirAsteriscos01();

  readln;
end.

