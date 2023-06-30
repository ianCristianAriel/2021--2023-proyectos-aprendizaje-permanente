program truco21Cartas;
const MAX_TARJETAS_GRUPO= 7; //Tarjetas por grupo
      MAX_GRUPOS= 3; //Cantidad de grupos
      MAX_TARJETAS= MAX_TARJETAS_GRUPO*MAX_GRUPOS; //Total de tarjetas.
      MIN_TARJETA_VALOR= 'A'; //Tarjeta incial, en este caso letra A.
      MAX_TARJETA_VALOR= chr(MAX_TARJETAS+ord('A')-1); //Tarjeta final.

type  tarjetas= MIN_TARJETA_VALOR..MAX_TARJETA_VALOR;
      grupo= array[1..MAX_TARJETAS_GRUPO] of tarjetas;
      mazo= array[1..MAX_TARJETAS] of tarjetas;
var   grupo1, grupo2, grupo3: grupo;
      deck: mazo;
      i, j, k, m, n, o, p, q, indice, secuencia: byte;
      letra, opcion: char;

begin


  randomize;
  for i:=1 to (MAX_GRUPOS*MAX_TARJETAS_GRUPO) do begin
    indice:= random(ord(MAX_TARJETA_VALOR)-ord(MIN_TARJETA_VALOR)+1)+ord(MIN_TARJETA_VALOR);
    letra:=chr(indice);

    j:=1;
    while j<i do begin
    if deck[j]=letra then begin
      j:=1;
      indice:= random(ord(MAX_TARJETA_VALOR)-ord(MIN_TARJETA_VALOR)+1)+ord(MIN_TARJETA_VALOR);
      letra:=chr(indice);
    end else begin
    j+=1;
    end;
  end;
    deck[i]:=letra;
end;


  //Se define la variable que se usaran para mostrar los valores de los grupos desde los casilleros "1".
  n:=1;
  o:=1;
  p:=1;
  {Se asigna los valores de targetas del mazo a cada grupo: }
  for k:=1 to (MAX_TARJETAS_GRUPO*MAX_GRUPOS) do begin

    if (k>=1) and (k<=7) then begin
      grupo1[p]:=deck[k];
      p+=1;
      end;

      if (k>7) and (k<=14) then begin
      grupo2[o]:=deck[k];
      o+=1;
      end;

      if (k>14) and (k<=21) then begin
      grupo3[n]:=deck[k];
      n+=1;
      end;
    end;

  writeln('Haremos 3 secuencias. Empecemos...');
  {Se muestran los grupos ebn columnas y se pregunta en cual de ellos esta la carta elegida: }
  for secuencia:=1 to MAX_GRUPOS do begin
    writeln('Secuencia ',secuencia,': '+#13#10);

    m:=1;

    repeat
        write('          ',grupo1[m],'   ',grupo2[m],'   ', grupo3[m],'   '+#13#10);
        m+=1;
      until (m=MAX_TARJETAS_GRUPO+1) ;



    write(#13#10+'En que grupo esta tu tarjeta [1,2,3]: ');
    readln(opcion);


    case opcion of
   //Se definen las variables que se usaran para mostrar los valores de los grupos desde los casilleros "1".

  '2': begin
      n:=1;
       o:=1;
       p:=1;
   //Se reasignan los valores de los grupos al mazo:
    for k:=1 to (MAX_TARJETAS_GRUPO*MAX_GRUPOS) do begin

    if (k>=1) and (k<=7) then begin
    deck[k]:=grupo3[p];
    p+=1;
      end;

      if (k>7) and (k<=14) then begin

      deck[k]:=grupo2[o];
      o+=1;
      end;

      if (k>14) and (k<=21) then begin

      deck[k]:=grupo1[n];
      n+=1;
      end;
    end;
 end;

  '3': begin
      n:=1;
       o:=1;
       p:=1;
      //Se definen las variables que se usaran para mostrar los valores de los grupos desde los casilleros "1".
    for k:=1 to (MAX_TARJETAS_GRUPO*MAX_GRUPOS) do begin

    if (k>=1) and (k<=7) then begin
      deck[k]:=grupo1[p];
      p+=1;
      end;

      if (k>7) and (k<=14) then begin
      deck[k]:=grupo3[o];
      o+=1;
      end;

      if (k>14) and (k<=21) then begin
      deck[k]:=grupo2[n];
      n+=1;
      end;
    end;
  end;

      '1': begin
       n:=1;
       o:=1;
       p:=1;
       //Se definen las variables que se usaran para mostrar los valores de los grupos desde los casilleros "1".
      for q:=1 to (MAX_TARJETAS_GRUPO*MAX_GRUPOS) do begin

    if (q>=1) and (q<=7) then begin
      deck[q]:=grupo3[p];
      p+=1;
      end;

      if (q>7) and (q<=14) then begin
      deck[q]:=grupo1[o];
      o+=1;
      end;

      if (q>14) and (k<=21) then begin
      deck[k]:=grupo2[n];
      n+=1;
      end;
    end;
 end;
      else begin //ERROR A CORREGIR
        writeln(#13#10+'Entrada invalida');
        write(#13#10+'En que grupo esta tu tarjeta [1,2,3]: ');
        readln(opcion);
      end;
    end;

  {Se reasignan los valores de targetas del mazo a cada grupo: }
  m:=1; n:=1;//Se definen las variables que se usaran para mostrar los valores de los grupos desde los casilleros "1".
  repeat
      grupo1[n]:=deck[m];
      m+=1;
      grupo2[n]:=deck[m];
      m+=1;
      grupo3[n]:=deck[m];
      m+=1;
      n+=1;
 until (m=(MAX_GRUPOS*MAX_TARJETAS_GRUPO)+1);
      end;
  write('La letra elegida es: ',deck[11]);
    readln;
    end.



