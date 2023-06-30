program calculoIva;
const iva=22;
  var valorSinIva, ivaCalculado, valorConIva: real;
begin
  write('Ingresa el valor de un producto: ');
  readln(valorSinIva);

  ivaCalculado:=valorSinIva*iva/100;

  valorConIva:=valorSinIva+ivaCalculado;

  writeln('El valor final del producto con el iva es: ',valorConIva:4:2);
  readln;
end.

