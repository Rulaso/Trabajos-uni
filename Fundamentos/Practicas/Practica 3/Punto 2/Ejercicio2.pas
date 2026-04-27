Program ejercicio2;
const 
	valorAlto = 999;
type
	data = record
		cod: integer;
		nombre: string[50];
		desc: string[100];
		precio: real;
		stock: integer;
	end;
	
	maestro = file of data;
	
procedure eliminarSinStock(var mae: maestro);
	procedure leerArchivo(var mae: maestro;var d: data);
	begin
		if(not eof(mae)) then begin
			read(mae, d);
		end else begin
			d.cod:= valorAlto;
		end;
	end;
var
	d: data;
begin
	reset(mae);
	leerArchivo(mae, d);
	while(d.cod <> valorAlto) do begin
		if(d.stock = 0) then begin
			d.nombre:= '@' + d.nombre;
			seek(mae, filepos(mae) -1);
			write(mae, d);
		end;
		leerArchivo(mae, d);
	end;
	close(mae);
end;

procedure crearArchivo(var mae: maestro);
	procedure leer(var d: data);
	begin
		writeln('Ingrese el codigo de prodcuto');
		readln(d.cod);
		
		writeln('Ingrese el nombre');
		readln(d.nombre);
		
		writeln('Ingrese la descripcion');
		readln(d.desc);
		
		writeln('Ingrese el precio');
		readln(d.precio);
		
		writeln('Ingrese el stock actual del producto');
		readln(d.stock);
	end;
var
	d: data;
	i, cant: integer;
begin
	reWrite(mae);
	writeln('Cuantos productos desdea agregar?');
	readln(cant);
	
	for i:= 1 to cant do begin
		leer(d);
		write(mae, d);
	end;
	
	close(mae);
end;

var
	mae: maestro;
begin
	assign(mae, 'maestro');
	
	crearArchivo(mae);
	
	eliminarSinStock(mae);
end.
