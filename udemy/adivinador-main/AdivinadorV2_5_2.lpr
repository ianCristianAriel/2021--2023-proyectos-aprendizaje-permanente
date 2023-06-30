program AdivinadorV2_5_2;

uses sysutils;

const max_intentos_facil=10;
      max_intentos_dificil=5;
      max_numero=100;
type Testado=(ES_MENOR, ES_MAYOR, PERDISTE, GANASTE);

     JUEGO= record
       retroalimentacion: Testado;
       numeroSecreto: byte;
       Max_intentos:byte;
     end;

var dif, c: char;
    noNum: boolean;
    lectura: string;
    k: juego;
    intento, numeroU, contL: byte;

procedure iniciarJuego(Idif: char);
begin
  intento:=0;

  case Idif of
  'D': begin
  k.max_intentos:= max_intentos_dificil;
  end;
  'F': begin
  k.max_intentos:= max_intentos_facil;
  end;
  end;

  randomize;
  k.numeroSecreto:=random(max_numero);

end;

function verificarNumero(n: byte): TEstado;

begin

if (n=k.numeroSecreto) then begin
result:=GANASTE;
end else if (intento=k.max_Intentos) and not (verificarNumero=GANASTE) then begin
result:=PERDISTE;
end else if (n<k.numeroSecreto) and not (verificarNumero=GANASTE) and not (verificarNumero=PERDISTE) then begin
Result:=Es_mayor;
end else if (n>k.numeroSecreto)  and not (verificarNumero=GANASTE) and not (verificarNumero=PERDISTE) then begin
result:=Es_menor;
end;

end;

begin
  noNum:=false;

  write('Elige la dificultad: FACIL[F] / DIFICIL[D] >>');
  readln(dif);
  while not (dif='D') and not (dif='F') do begin
    write('Error. Ingresa [F] o [D] >> ');
    readln(dif);
    end;
  iniciarJuego(dif);

  writeln;

  writeln('Dispones de ',k.max_intentos,' intentos.');

  writeln;

  repeat

  intento+=1;
  write('Intento: ', intento,'>> ');
  repeat
  readln(lectura);
  for c in lectura do begin
  if (ord(c)<48) or (ord(c)>57) or ((c=' ') and (contL<3)) then begin
  noNum:=true;
  contL:=+1;
  end;
  end;
  until not noNum;

  numeroU:=strtoint(lectura);

  if (verificarNumero(numeroU)=PERDISTE) then begin
  write('PERDISTE!. El numero era: ',k.numeroSecreto);
  break;
  end else if (verificarNumero(numeroU)=GANASTE) THEN BEGIN
  write('GANASTE!!');
  break;
  end else if (verificarNumero(numeroU)=ES_MENOR) THEN BEGIN
  write('Es menor. ');
  end else if (verificarNumero(numeroU)=ES_MAYOR) then begin
  write('Es mayor. ');
  end;

  until (intento=k.max_intentos);

  readln;
end.

