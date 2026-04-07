program ejercicio1;
const
	valorAlto = 999;
type

	data = record
		cod: integer;
		nombre: string[30];
		monto: real;
	end;
	
	archivo = file of data;
	
procedure generarArchivo(var arch: archivo);
	procedure leer(var d: data);
	begin
		writeln('Ingrese el codigo de empleado');
		readln(d.cod);
		
		writeln('Ingrese el nombre del empleado');
		readln(d.nombre);
		
		writeln('Ingrese el monto de la comision del empleado');
		readln(d.monto);
	end;
	
	
	
var
	i: integer;
	d: data;
begin
	reWrite(arch);
	
	for i:=1 to 5 do begin
		leer(d);
		
		write(arch, d);
	end;

	close(arch);
end;

procedure leerArchivo(var det: archivo; var d: data);
begin
	if(not eof(det)) then begin
		read(det, d);
	end else begin
		d.cod:= valorAlto;
	end;
end;

procedure actualizarMaestro(var mae, det: archivo);

var
	d, act: data;
	total: real;
begin
	reset(det);
	reWrite(mae);
	leerArchivo(det, d);
	while(d.cod <> valorAlto) do begin
		act:= d;
		total:= 0;
		while(d.cod = act.cod) do begin
			act:= d;
			total:= total + act.monto;
			leerArchivo(det, d);
		end;
		act.monto:= total;
		write(mae, act);
	end;
	
	close(det);
	close(mae);
end;

procedure mostrarArchivo(var a: archivo);
var
	d: data;
begin
	reset(a);
	leerArchivo(a, d);
	
	while(d.cod <> valorAlto) do begin
		writeln('El codigo de empleado es ', d.cod);
		writeln('El nombre del empleado es ',d.nombre);
		writeln('El monto del empelado es ',d.monto:0:2);
	
		leerArchivo(a, d);
	end;

	close(a);
end;

var
	mae, det: archivo;
begin
	assign(mae, 'maestro');
	assign(det, 'detalle');
	
	{writeln('---INGRESE LA INFORMACION DEL ARCHIVO DETALLE---');
	generarArchivo(det);}
	
	mostrarArchivo(det);
	
	actualizarMaestro(mae, det);
	
	mostrarArchivo(mae);
	
end.
