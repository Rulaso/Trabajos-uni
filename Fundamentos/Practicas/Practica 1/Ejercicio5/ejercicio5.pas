program punto5;
const 
	valorAlto=9999;
type
	data = record
		codigo: integer;
		nombre: string;
		desc: string;
		marca: string;
		precio: real;
		stockMinimo: integer;
		stockActual: integer;
	end;
	
	archivo = file of data;
	
procedure crearTexto(var archTxt: Text);
	procedure leer(var d: data);
	begin
		writeln('Ingrese el codigo del celular');
		readln(d.codigo);
		
		writeln('Ingrese el precio del celular');
		readln(d.precio);
		
		writeln('Ingrese la marca del celular');
		readln(d.marca);
		
		writeln('Ingrese el stock actual');
		readln(d.stockActual);
		
		writeln('Ingrese el stock minimo');
		readln(d.stockMinimo);
		
		writeln('Ingrese la descripcion');
		readln(d.desc);
		
		writeln('Ingrese el nombre del modelo');
		readln(d.nombre);
	end;
	
var
	d: data;
	i: integer;
begin
	reWrite(archTxt);
	
	for i:=1 to 5 do begin
		leer(d);
		
		writeln(archTxt, d.codigo,' ', d.precio,' ', d.marca);
		writeln(archTxt, d.stockActual,' ', d.stockMinimo, ' ', d.desc);
		writeln(archTxt, d.nombre);
	end;
	
	close(archTxt);
end;

procedure crearArchivo(var arch: archivo; var archTxt: Text);
	procedure leerArchivoTexto(var txt: Text; var d: data);
	begin
		if(not eof(txt)) then begin
			readln(archTxt, d.codigo, d.precio, d.marca);
			readln(archTxt, d.stockActual, d.stockMinimo, d.desc);
			readln(archTxt, d.nombre);
		end else begin
			d.codigo:= valorAlto;
		end;
	end;
var
	d: data;
begin
	reWrite(arch);
	reset(archTxt);
	

	
	leerArchivoTexto(archTxt, d);
	
	while(d.codigo <> valorAlto) do begin
		write(arch, d);
		
		
		leerArchivoTexto(archTxt, d);
	end;
	
	close(arch);
	close(archTxt);
end;

procedure leerArchivo(var arch: archivo; var d: data);
begin
	if(not eof(arch)) then begin
		read(arch, d);
	end else begin
		d.codigo:= valorAlto;
	end;
end;

procedure mostrarPocoStock(var arch: archivo);
var
	d: data;
begin
	reset(arch);
	
	leerArchivo(arch, d);
	
	while(d.codigo <> valorAlto) do begin
		if(d.stockActual < d.stockMinimo) then begin
			writeln;
			writeln('El siguiente modelo tiene poco stock');
			writeln(d.codigo,' ',d.precio:0:2,' ',d.marca);
			writeln(d.stockActual,' ',d.stockMinimo,' ',d.desc);
			writeln(d.nombre);
			writeln;
		end;
	
		leerArchivo(arch, d);
	end;
	writeln('---SE PROCESARON TODOS LOS CELULARES---');
	close(arch);
end;

procedure mostrarDescripciones(var arch: archivo);
var
	d: data;
begin
	reset(arch);
	
	leerArchivo(arch, d);
	
	while(d.codigo <> valorAlto) do begin
		writeln;
		writeln('La descripcion del producto es: ');
		writeln(d.desc);
		writeln;
	
		leerArchivo(arch, d);
	end;
	
	writeln('---SE PROCESARON TODOS LOS CELULARES---');
	close(arch)
end;

procedure exportarArchivo(var arch: archivo; var archTxt: Text);
var
	d: data;
begin
	reWrite(archTxt);
	reset(arch);
	
	leerArchivo(arch, d);
	
	while(d.codigo <> valorAlto) do begin
		writeln(archTxt, d.codigo, ' ',d.precio,' ',d.marca);
		writeln(archTxt, d.stockActual,' ',d.stockMinimo,' ',d.desc);
		writeln(archTxt, d.nombre);
	
		leerArchivo(arch, d);
	end;
	
	writeln('---SE EXPORTARON TODOS LOS CELULARES---');
	close(arch);
	close(archTxt);
end;

var
	arch: archivo;
	archTxt: Text;
	opcion: integer;
begin
	assign(arch, 'RegistroCelulares');
	assign(archTxt, 'celulares');
	//crearTexto(archTxt);
	
	writeln('Ingrese el numero de la opcion seleccionada');
	writeln('1_ Crear Archivo');
	writeln('2_ Mostrar celulares con poco stock');
	writeln('3_ Mostrar descripciones de celulares');
	writeln('4_ Exportar a texto');
	readln(opcion);
	
	case opcion of 
		1: crearArchivo(arch, archTxt);
		2: mostrarPocoStock(arch);
		3: mostrarDescripciones(arch);
		4: exportarArchivo(arch, archTxt);
	end;
	
end.
