program P02Ejersicio1;
var numero1: byte;
  numero4: integer;
begin
  write('Ingresa un numero de cuatro cifras: '+#13#10);
  readln(numero4);

  write('Ingresa un digito numerico: ');
  readln(numero1);

  writeln(numero4);
  if(numero4 div 1000)=numero1 then begin
    write('+');
    end else begin
      write(' ');
      end;
  if (numero4 mod 1000 div 100)=numero1 then begin
    write('+');
    end else begin
      write(' ');
      end;
  if (numero4 mod 100 div 10)=numero1 then begin
    write('+');
    end else begin
      write(' ');
      end;
  if (numero4 mod 10)=numero1 then begin
    write('+');
    end else begin
      write(' ');
      end;

    readln;
  end.

