program adivinoV2_5;
const Max_intentos_dificil=5;
      max_Intentos_Facil=15;
TYPE Tdificultad=(facil, dificil);
var numeroS, numeroI, i, max_Intentos: byte;
  dificultad: TDificultad;
  adivino: boolean;
  opcionDif: char;

begin
  randomize;
  numeroS:= random(101);
  adivino:= false;

  writeln('Adivinador 2.5: Igresa FACIL [F] O DIFICIL [D] '+#13#10);
  readln(opcionDif);
  case opcionDif of
 'F': dificultad:=facil;

 'D': dificultad:=dificil;
  end;

  case dificultad of
   facil: max_intentos:=max_intentos_Facil;

   dificil: max_intentos:=max_intentos_dificil;
  end;

  writeln('Dispones de ',Max_intentos,' cantidad de intentos.');

  for i:=1 to max_Intentos do begin
  write('intento ',i,': ');
  readln(numeroI);
    if numeroI>NumeroS then begin
      write('El numero a adivinar es menor..');
      end
    else if numeroI<numeroS then begin
      write('El numero a adivinar es mayor..');
      end
    else if numeroI=numeroS then begin
      write('GANASTE..');
      adivino:= true;
      break;
      end;
    end;
  if (i=max_Intentos) and not adivino then begin
    write(' PERDISTE..'+#13#10+'NUMERO SECRETO: ',numeroS);
  end;

  readln;
end.

