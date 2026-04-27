program ejercicio1;
const
	valorAlto = 999;
type
	data = record
		numeroEmpleado: integer;
		apellido: string;
		nombre: string;
		edad: integer;
		dni: integer;
	end;
	
	archivo = file of data;
procedure agregarEmpelados(var arch: archivo);
	procedure leer(var d: data);
	begin
		writeln('Ingrese el apellido del empelado');
		readln(d.apellido);
		
		if(d.apellido <> 'fin') then begin
			writeln('Ingrese el nombre del empleado');
			readln(d.nombre);
			
			writeln('Ingrese el numero de empleado');
			readln(d.numeroEmpleado);
			
			writeln('Ingrese la edad del empleado');
			readln(d.edad);
			
			writeln('Ingrese el dni del empleado');
			readln(d.dni);
		end;
	end;
var
	empleado: data;
	begin
	leer(empleado);
		
	while(empleado.apellido <> 'fin') do begin
		write(arch, empleado);
		
		leer(empleado);
	end;
end;

procedure crearArchivo(var arch: archivo);
begin
	reWrite(arch);
	reset(arch);	
	agregarEmpelados(arch);
	close(arch);
end;

procedure listarArchivo(var arch: archivo);
	procedure listarNombres(var arch: archivo);
	var
		empleado: data;
		nombre: string;
	begin
		writeln('Ingrese el nombre o apellido a buscar');
		readln(nombre);
		
		while(not eof(arch)) do begin
			read(arch, empleado);

			if(nombre = empleado.nombre) or (nombre = empleado.apellido) then begin
				writeln;
				writeln('Los datos del empelado buscado son');
				writeln('nombre completo ', empleado.nombre,' ', empleado.apellido);
				writeln('edad ', empleado.edad, ', DNI ', empleado.dni);
				writeln('numero de empelado ', empleado.numeroEmpleado);
				writeln;
				writeln('---SIGUIENTE---');
				writeln;
			end;
		end;
	end;

	procedure listarEmpleados(var arch: archivo);
	var
		d: data;
	begin
		writeln('LISTADO DE TODOS LOS EMPLEADOS');
		while(not eof(arch)) do begin
			read(arch, d);
		
			writeln('nombre completo ', d.nombre,' ', d.apellido);
			writeln('edad ', d.edad, ', DNI ', d.dni);
			writeln('numero de empelado ', d.numeroEmpleado);
			writeln;
			writeln('---SIGUIENTE---');
			writeln;
		end;
	
		writeln('SE LISTARON TODOS LOS EMPELADOS CARGADOS');
	end;

	procedure listarJubilados(var arch: archivo);
	var
		d: data;
	begin
		while(not eof(arch)) do begin
			read(arch, d);
		
			if(d.edad >= 70) then begin
				writeln('EL SIGUIENTE EMPELADO ESTA PROXIMO A JUBILARSE');
				writeln('nombre completo ', d.nombre,' ', d.apellido);
				writeln('edad ', d.edad, ', DNI ', d.dni);
				writeln('numero de empelado ', d.numeroEmpleado);
			end;
		end;
	end;
begin
	reset(arch);
	listarNombres(arch);
	writeln;
	seek(arch, 0);
	listarEmpleados(arch);
	writeln;
	seek(arch, 0);
	listarJubilados(arch);
	close(arch);
end;

procedure anadirEmpelados(var arch: archivo);
var
	sigo: boolean;
	aux: integer;
begin
	reset(arch);
	sigo:= true;
	
	
	while(sigo) do begin
	
		seek(arch, fileSize(arch));
		agregarEmpelados(arch);
		writeln('quiere agregar otro empelado?');
		writeln('1_ SI');
		writeln('2_ NO');
		readln(aux);
		
		if(aux = 1) then begin
			sigo:= true;
		end else 
			sigo:= false
	end;
	close(arch);
end;

procedure modificarEdad(var arch: archivo);
var
	d: data;
	nombre: string;
	edad: integer;
begin
	reset(arch);
	writeln('Ingrese el nombre del empleado a modificar');
	readln(nombre);
	
	writeln('Ingrese la nueva edad del empleado');
	readln(edad);
	
	read(arch, d);
	
	if(d.nombre = nombre) then begin
		d.edad:= edad;
		seek(arch, 0);
		write(arch, d);
	end else begin 
		while (not eof(arch)) and (d.nombre <> nombre) do begin
			read(arch, d);
		end;
		
		if(d.nombre = nombre) then begin
			d.edad:= edad;
			seek(arch, filePos(arch)-1);
			write(arch, d);
		end else begin
			writeln('El empleado no existe dentro del archivo');
		end;
	end;
	close(arch);
end;

procedure exportarArchivo(var arch: archivo; var archTxt1: Text);
var
	nomFis: string;
	d: data;
begin
	writeln('Ingrese un nombre para el archivo de texto');
	readln(nomFis);
	
	assign(archTxt1, nomFis);
	reWrite(archTxt1);
	reset(arch);
	while(not eof(arch)) do begin
		read(arch, d);
		writeln('LEYO UN REGISTRO');
		writeln(archTxt1,d.numeroEmpleado, ' ', d.dni, ' ', d.edad, ' ', d.nombre);
		writeln('CARGO TODO MENOS EL APELLIDO');
		writeln(archTxt1,d.apellido);
		writeln('COMPLETO UNA CARGA');
	end;
	writeln('TERMINO LA CARGA');
	close(arch);
	close(archTxt1);
end;

procedure exportarSinDNI(var arch: archivo; var archTxt2: Text);
var
	d: data;
begin
	writeln('COMIENZA LA EXPORTACION');
	
	while(not eof(arch)) do begin
		read(arch, d);
		if(d.dni = 0) then begin
			writeln(archTxt2, d.numeroEmpleado, ' ', d.dni, ' ', d.edad, ' ', d.nombre);
			writeln(archTxt2, d.apellido);
		end;
	end;
	
	writeln('FINALIZO LA EXPORTACION');
end;

procedure eliminarEmpleado(var a: archivo);
	procedure leerArchivo(var a: archivo; var reg: data);
	begin
		if(not eof(a)) then begin
			read(a, reg);
		end else begin
			reg.numeroEmpleado:= valorAlto;
		end;
	end;
var
	num, pos: integer;
	reg: data;
begin
	reset(a);
	writeln('Ingrese el numero de empleado a eliminar');
	readln(num);
	leerArchivo(a, reg);
	while(reg.numeroEmpleado <> valorAlto) and (reg.numeroEmpleado <> num) do begin
		leerArchivo(a, reg);
	end;
	
	if(reg.numeroEmpleado <> valorAlto) then begin
		pos := filepos(a) -1;
		seek(a, filesize(a) -1);
		read(a, reg);
		seek(a, pos);
		write(a, reg);
		seek(a, filesize(a)-1);
		truncate(a);
	end;
end;
	
var
	arch: archivo;
	nomFis: string;
	opcion: integer;
	archTxt1, archTxt2: Text;
begin
	
	writeln('Seleccione el numero de la opcion elegida');
	writeln('1_ Crear archivo');
	writeln('2_ Abrir archivo');
	writeln('3_ Añadir empleados');
	writeln('4_ Modificar edad');
	writeln('5_ Exportar a archivo de texto');
	writeln('6_ Exportar empelados sin dni');
	writeln('7_ Eliminar empleados');
	readln(opcion);
	
	writeln('Ingrese el nombre del archivo');
	readln(nomFis);
	assign(arch, nomFis);
	
	case opcion of
		1: crearArchivo(arch);
		2: listarArchivo(arch);
		3: anadirEmpelados(arch);
		4: modificarEdad(arch);
		5: exportarArchivo(arch, archTxt1);
		6: exportarSinDNI(arch, archTxt2);
		7: eliminarEmpleado(arch);
	end;
end.

