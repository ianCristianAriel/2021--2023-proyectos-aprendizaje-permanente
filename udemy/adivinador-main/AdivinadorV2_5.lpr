program AdivinadorV2_5;
const MAX_INTENTOS_FACIL=15;
      MAX_INTENTOS_DIFICIL=10;
      NUMERO_MAXIMO=100;

type TDificultad= (FACIL, DIFICIL);
     TEstado= (JUGANDO, GANO, PERDIO);
     TResultado=(ES_MAYOR, ES_IGUAL, ES_MENOR);
     TJuego= record
       dificultad: TDificultad;
       maxIntentos:byte;
       estado: TEstado;
       numeroSecreto: byte;
     end;

var intento, numeroU:byte;
    dificultad: char;
    k:TJuego;

procedure iniciarJuego(d: char; var J: TJuego);
  begin

  case d of

  'F': begin
  j.Dificultad:=FACIL;
  J.MaxIntentos:=max_intentos_facil;
  end;

  'D': begin
  j.Dificultad:=DIFICIL;
  j.MaxIntentos:= max_intentos_dificil;
  end;

  end;

  J.estado:=JUGANDO;
  intento:=1;

  randomize;
  j.numeroSecreto:=random(NUMERO_MAXIMO);

  end;

function verificarNumero(n:byte; var J:TJuego):TResultado;
begin

if (n=J.NumeroSecreto) then begin
  j.estado:=GANO;
  exit;
  end else if (intento=j.maxIntentos) and (j.estado<>GANO) then begin
    j.estado:=PERDIO;
    end;

if (n>j.numeroSecreto) then begin
    Result:=ES_menor;
    end else if (n<j.numeroSecreto) then begin
    result:=ES_MAYOR;
    end else if (n=j.numeroSecreto) then begin
        result:=ES_IGUAL;
        end;


end;
begin
  writeln('Adivinador V2.5');
  writeln;

  write('Ingresa la dificultad: FACIL[F] / DIFICIL[D] >>');
  readln(dificultad);
  while (dificultad <> 'F') and (dificultad <> 'D') do begin
    write('Error, ingresa F o D: ');
    readln(dificultad);
    end;
  IniciarJuego(dificultad, k);
  Writeln;

  writeln('Dispones de ',k.maxIntentos,' intentos');

  repeat
  write('Intento ',intento,' >>');
  readln(numeroU);
  verificarNumero(numeroU, k);

  if (verificarNumero(numeroU, k)=ES_MENOR) and (k.estado <>GANO) and (k.estado<>PERDIO) then begin
      write('Es menor. ');
  end else if (verificarNumero(numeroU, k)=ES_MAYOR) then begin
      write('Es mayor. ');
      end;

  intento+=1;
  until (K.estado<>jugando);

  if (k.estado=PERDIO) then begin
      writeln;
      write('PERDISTE!!, el numero era: ',k.numeroSecreto);
  end else if (k.estado=GANO) then begin
      writeln;
      write('GANASTE!!');
  end;

  readln;

end.

