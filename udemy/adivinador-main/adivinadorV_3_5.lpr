program adivinadorV_3_5;

const MAX_INTENTOS_FACIL=15;
      MAX_INTENTOS_DIFICIL=10;
      numero_maximo=100;

type TDificultad=(facil, dificil);
     TEstado=(jugando, gano, perdio);
     TResultado=(ES_MAYOR, ES_IGUAL, ES_MENOR);
     TJuego= record
       dificultad: TDificultad;
       estado: TEstado;
       numeroSecreto, maxIntentos, intentoActual: byte;
     end;

var juego: TJuego;
    numeroUsuario: byte;
    dif:char;
    Resultado: TResultado;

procedure iniciarJuego(d: TDificultad; var j: TJuego);

begin

   j.dificultad:=d;
   if d=FACIL then
      j.maxIntentos:= MAX_INTENTOS_FACIL
      else
      j.maxIntentos:=MAX_INTENTOS_DIFICIL;
   j.estado:=JUGANDO;
   j.intentoActual:=0;

   randomize;
   j.numeroSecreto:=random(numero_maximo)+1;

end;

function verificarNumero(n: byte; var j:TJuego): TResultado;

begin

   j.intentoActual+=1;
   if n=j.numeroSecreto then begin
      j.estado:=GANO
   end else if (j.intentoActual=j.maxIntentos) then begin
      j.estado:=PERDIO;
   end;

   if n=j.numeroSecreto then begin
         result:=ES_IGUAL;
   end else if j.numeroSecreto<n then begin
         result:= es_MENOR;
   end else begin
     result:= ES_MAYOR;
   end;

end;

begin

  write('Elije la dificultad F(facil) D(dificil): ');
  readln(dif);
  while (dif<>'F') and (dif<>'f') and (dif<>'D') and(dif<>'d') do begin
       write('ERROR, ingresa "F" o "D": ');
       readln(dif);
  end;

  case dif of
  'f', 'F': iniciarJuego(facil, juego);
  'd','D': iniciarJuego(dificil, juego);
  end;

  writeln;
  writeln('Dispones de ',juego.MaxIntentos,' para adivinar.');
  writeln;

  repeat
    write('intento ',juego.IntentoActual+1,' >>');
    readln(numeroUsuario);
    resultado:= verificarNumero(numeroUsuario,juego);
    case resultado of
     ES_mayor: writeln('El numero a adivinar es mayor');
     ES_MENOR: writeln('El numero a adivinar es menor');
    end;
  until juego.estado<>JUGANDO;

  if juego.estado=gano then begin
     writeln('GANASTE!!');
  end else begin
     writeln('PERDISTE!, el numero era: ',juego.numeroSecreto);
  end;

readln;
end.

