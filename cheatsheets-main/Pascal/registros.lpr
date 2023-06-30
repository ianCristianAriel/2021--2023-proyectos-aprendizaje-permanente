program registros;
type TPersona= record
     Nombre,Apellido: string;
     edad: byte;
     end;
     casilleros= array [1..10] of TPersona;//Los registros se pueden utilizar en arreglos ya que son como un tipo de dato
var i:byte;
    cas: casilleros;
    p1, p2: TPersona; //Siempre se utilizan mediante variables ya que un registro funcionan como un tipo de dato
procedure base(P:TPersona);
begin
{Se puede utilizar with para ahorrar escribir la variable un punto y  el nombre del registro}
  with p do
  write('Nombre: '+nombre+' '+' Edad: ',edad);
  end;

procedure Muestra();
var i:byte;
begin

  for i:=1 to 4 do begin
    writeln(cas[i].Nombre+' ',cas[i].edad);
  end;

end;
begin
  with p1 do begin //Si son mas de una instruccion lleva begin luego del "do", al igual que el resto de bloques
  write('Ingres un nombre: ');
  readln(nombre);

  write('Ingresa una edad: ');
  readln(edad);
  end;

  p2:=P1;

  write('Persona 1: ');
  base(p1);

  write('Persona 2: ');
  base(p2);

  for i:=1 to 4 do begin
    readln(cas[i].nombre, cas[i].edad);
  end;

  Muestra;

  readln;
end.

