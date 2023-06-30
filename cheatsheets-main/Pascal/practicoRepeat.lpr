program practicoRepeat;
const pi=3.14;
var base, alto, largo, radio, perimetro, area: real;
    opcion: char;
    salir: boolean;
begin
salir:=false;
repeat
  writeln('Calculador de medidas de figuras geometricas'+#13#10);
  writeln('1. Area de rectangulo'+#13#10+'2. Perimetro de rectangulo');
  writeln('3. Area circunferencia'+#13#10+'4. Perimetro circunferencia');
  writeln('5. Area triangulo'+#13#10+'6. Perimetro triangulo');
  writeln('0. Salir');
  readln(opcion);

    case opcion of
    '1': begin
    write('Ingresa medida del largo: ');
    readln(largo);
    writeln('Ingresa la medida del alto: ');
    readln(alto);
    area:=alto*largo;
    writeln('El area es: ',area:4:2);
    end;
    '2': begin
    write('Ingresa medida del lado: ');
    readln(largo);
    perimetro:=largo*2 + alto*2;
    writeln('El perimetro es: ',perimetro:4:2);
    end;
    '3': begin
    write('Ingresa el radio: ');
    readln(radio);
    area:=radio*radio*pi;
    writeln('El area es: ',area:4:2);
    end;
    '4': begin
    writeln('Ingresa el radio: ');
    readln(radio);
    perimetro:=radio*2*pi;
    writeln('El perimetro es: ',perimetro:4:2);
    readln;
    end;
    '5': begin
    writeln('Ingresa la base: ');
    readln(base);
    writeln('Ingresa la altura: ');
    readln(alto);
    area:=base*alto/2;
    writeln('El area es: ',area:4:2);
    end;
    '6': begin
    writeln('Ingresa la base: ');
    readln(base);
    perimetro:=base*3;
    writeln('El perimetro es: ',perimetro:4:2);
    end;
    '0': begin
    salir:=true;
    write('Saliendo..');
    end;
    else begin
      write('La opcion ingresa es incorrecta..');
    end;
  end;
  readln;
  writeln;
 until salir;

end.

