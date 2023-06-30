program adivinadorV3;
uses math;
var numeroP, i, min, max, cantidadIntentos: integer;
    opcion: char;
    adivino, trampa: boolean;
begin
  adivino:= false;
  trampa:= false;

  write('Adivinador 3.0'+#13#10);
  writeln('Ingresa el numero maximo: ');
  readln(max);
  writeln('Ingresa el numero minimo: ');
  readln(min);

  cantidadIntentos:= round(log2(max-min+1)+1);

  writeln('Adivinare tu numero en ',cantidadIntentos,' intentos..');
  writeln('Preciona..'+#13#10+'"<" si tu numero es mayor que el mostrado'+#13#10+'">" si tu numero es menor que el mostrado'+#13#10'"=" si tu numero es el mostrado');
  writeln;

repeat
for i:=1 to cantidadIntentos do begin
  numeroP:= (max-min) div 2 + min;
  writeln(numeroP);
  writeln('Opcion: ');
  readln(opcion);
  if (min>max) or (max<min) then begin
    trampa:= true;
    writeln('Estas haciendo trampa..');
    end;
  case opcion of
  '>': begin
    max:= numeroP-1;
  end;
  '<': begin
    min:=numeroP+1;
  end;
  '=': begin
    writeln('GANE');
    adivino:=true;
    break;
  end;
  else begin
    write('Error, entrada invalida..');
  end;
end;
  end;

  if not adivino and not trampa then begin
  writeln('Ganaste, no pude adivinar el numero');
  end;
  writeln('Saliendo..');
  readln;
until adivino or trampa;
end.

