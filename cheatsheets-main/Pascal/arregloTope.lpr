program arregloTope;
const max_casilleros= 100;
      max_numero= 1000;

type TArreglo= array[1..max_casilleros] of integer;
     TLista= record
       numeros: TArreglo;
       Tope: byte;
     end;

procedure ejemplo1;

var lista: TLista;
    i: byte;

begin

  write('Cuantos numeros quieres imprimir?>> ');
   readln(lista.tope);
    for i:=1 to lista.tope do begin
    lista.numeros[i]:=random(max_numero)+1;
    end;

    for i:=1 to lista.tope do begin
    write(lista.numeros[i],' ');
    end;

readln;
end;

procedure ejemplo2;

var lista: TArreglo;
    i, cantidad: byte;
    numero: integer;

begin
randomize;
write('Cuantos numeros quieres generar?>> ');
readln(cantidad);

for i:=low(lista) to cantidad do begin
lista[i]:=random(max_numero)+1;
write(lista[i],' ');
end;

end;

begin
  ejemplo1; readln;

  ejemplo2; readln;

end.

