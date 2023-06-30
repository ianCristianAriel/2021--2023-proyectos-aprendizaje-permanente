program enumerado;
type TDias= (DOMINGO, LUNES, MARTES, MIERCOLES, JUEVES, VIERNES, SAVADO);
VAR d: TDias;
    i, maximo:byte;
procedure impresionAutomatica;
begin
  for i:=0 to 6 do begin //El valor minimo siempre es cero para un enumerado
    write(TDias(i),' ');
  end;

  readln;
end;

procedure segunDia;
var d: TDias;
begin
  write('Ingresa dia (Con case):');
  readln(d);

  case d of
      DOMINGO: writeln('Dia de descanso');
      LUNES, MARTES, MIERCOLES, JUEVES, VIERNES: writeln('Dia de trabajo');
      SAVADO: writeln('Algunos trabajan y otros no');
  end;
  readln;

  write('Ingresas dia (Con if):');
  readln(d);

  if d=martes then begin
    writeln('Es el segundo dia');
  end;

readln;
end;

procedure valorOrdinal;
var d:TDias;
    i: byte;
begin
  write('Ingresa un dia de la semana: ');
  readln(d);

  i:=ord(d);
  writeln(i);

  readln;
end;

procedure valoresMaximos;

begin
maximo:= ord(high(TDias(I)));
writeln(maximo);

for i:=0 to maximo do begin
  write(TDias(I),' ');
end;

readln;
end;

procedure Anteriores_Siguientes;
VAR d1, d2: TDias;
begin
write('Ingresa un dia semanal: ');
readln(d1);

d1:=d2;

repeat

  if (d2=savado) then begin
  d2:=domingo;
  end;

  if (d2<savado) then begin
  d2:=succ(d2);
  end;

write(d2);

until d2=d1;

readln;
end;

begin
impresionAutomatica;

segunDia;

valorOrdinal;

valoresMaximos;

anteriores_Siguientes;

readln;
end.
