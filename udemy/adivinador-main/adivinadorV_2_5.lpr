program adivinadorV_2_5;
const MAX_INTENTOS_facil=10;
      MAX_INTENTOS_Dificil=5;
type TDificultad=(FACIL, DIFICIL);
var nSecreto, nUsuario, i, max_Intentos: byte;
    dif: char;
    adivino:boolean;
    dificultad: TDificultad;
begin
randomize;
nSecreto:=random(100)+1;
adivino:=false;

writeln('Adivinador 2.5 ');

repeat
write('Ingresa F (facil) o D (dificil): ');
readln(dif);

case dif of

      'F', 'f': begin
      max_intentos:= MAX_INTENTOS_Dificil;
      dificultad:= facil;
      end;

      'D', 'd': begin
      max_Intentos:=MAX_INTENTOS_facil;
      dificultad:=Dificil;
      end;

end;
until (dif='D') or (dif='d') or (dif='F') or (dif='f');

writeln;

writeln('Dispones de ',max_intentos,' intentos para adivinar.');

for i:=1 to max_intentos do begin
  write('Intento ',i,': ');
  readln(nUsuario);

  adivino:= nSecreto=nUsuario;
  if adivino then begin
     write('Ganaste!!');
     break;
  end else if nSecreto>nUsuario then begin
  writeln ('El numero a adivinar es mayor..');
  end else begin writeln('El numero a adivinar es menor..');
end;
end;

if (i=MAX_INTENTOS) and not adivino then begin
   writeln('PERDISTE: El numero era ',nSecreto);
end;

readln
end.

