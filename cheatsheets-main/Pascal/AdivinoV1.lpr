program AdivinoV1;
Const numeroSecreto= 5;
      cantidadIntentos= 4;
var i, numeroIngresado: byte;
    adivino: boolean;
begin
  writeln('Adivina el numero: '+#13#10);

  for i:= cantidadIntentos downto 1 do begin
    write('Te quedan ',i,' intentos: ');
    readln(numeroIngresado);

    adivino:= numeroIngresado=NumeroSecreto;
    if adivino then begin
      write('Ganaste..');
      break;
    end;
  end;
  if not adivino then begin
    write('Perdiste, se te acabaron los intentos');
  end;
  readln;
end.

