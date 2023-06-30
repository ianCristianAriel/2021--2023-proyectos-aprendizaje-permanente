program P02Ejersicio;
 var a, b, c, d, e, f: byte;
     ecuacionN: integer;
     x, y: real;
begin
  writeln('{a x + b y = c   ...  d x + e y = f}'+#13#10'Ingresa los valores solicitados despues de precionar ENTER...');
  readln;
  write('Ingresa el valor a: '); readln(a);
  write('Ingresa el valor de b: '); readln(b);
  write('Ingresa el valor de c: ');readln(c);
  write('ingresa el valor de d: '); readln(d);
  write('Ingresa el valor de e: '); readln(e);
  write('Ingresa el valor de f: ');readln(f);

  ecuacionN:= a*e-d*b;

  if ecuacionN=0 then begin
    writeln('Error, los valores ingresados dan como resuñtado "0"');
  end else begin
  x:= (c*e-f*b)/(a*e-d*b);
  y:= (a*f-d*c)/(a*e-d*b);
  writeln('X= ',x:4:2);
  writeln('Y= ',y:4:2);
  end;
  readln;
end.

