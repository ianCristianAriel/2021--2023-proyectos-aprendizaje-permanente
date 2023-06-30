program caracteres;
uses sysutils;
var c: char;
    posibleNumero: string;
    error: boolean;
    numero:integer;
begin

  //soloNumeros:=true;

  write('Ingresa un numero: ');
  repeat
   posibleNumero:='';
  repeat
    error:=false;
    read(c);
    if (c>'9') or (c<'0') then begin
     // soloNumeros:=false;
      error:=true;
    end else begin
      posibleNumero+=c;
    end;
    until eoln or error;


    if error then begin
      write('Error. Ingresa solo numeros: ');
    end;
    readln;
    until not error;

    numero:= strToInt(posibleNumero);
    write('El numero ingresado es: ',numero);

    readln;
  end.
