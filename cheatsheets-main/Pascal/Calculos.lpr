program Calculos;

uses areaPerimetro;
var c:char;
    v1, v2, v3: real;
    figura: TFigura;

begin

  Write('Ingresa: [R]Rectangulo / [T]Triangulo / [C]Circulo >> ');
  readln(c);
  while (c<>'R') and (c<>'T') and (c<>'C')  do begin
    write('ERROR. Ingresa [R] / [T] /[C] >> ');
    readln(c);
  end;

  case c of
  'R': figura:=TFigura.RECTANGULO;
  'T': figura:=TFigura.TRIANGULO;
  'C': figura:=TFigura.CIRCULO;
  end;

  case figura of
  TFigura.RECTANGULO: begin
    write('Ingresa el largo: ');
    readln(v1);
    write('Ingresa el ancho ');
    readln(v2);
    writeln('AREA: ',calcularArea(figura, v1, v2):4:2);
    write('PERIMETRO: ',calcularPerimetro(figura, v1, v2, 0):4:2);
    end;
  TFigura.TRIANGULO:begin
    write('Ingresa la base: ');
    readln(v1);
    write('Ingresa la altura: ');
    readln(v2);
    writeln('AREA: ',calcularArea(figura, v1, v2):4:2);
    write('Ingresa el valor del lado 1: ');
    readln(v1);
    write('Ingresa el valor del lado 2: ');
    readln(v2);
    write('Ingresa el valor del lado 3: ');
    readln(v3);
    write('PERIMETRO: ',calcularPerimetro(figura, v1, v2, v3):4:2);

    end;
  TFigura.CIRCULO: begin
    write('Ingresa el radio: ');
    readln(v1);
    writeln('AREA: ',calcularArea(figura, v1, 0):4:2);
    write('PERIMETRO: ',calcularPerimetro(figura, v1, 0, 0 ):4:2);
    end;
  end;


  readln;
end.

