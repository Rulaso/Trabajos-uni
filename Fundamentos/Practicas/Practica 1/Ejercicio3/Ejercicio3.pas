program ejercicio3;
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
			writeln('Los datos del empelado buscado son');
			writeln('nombre completo ', empleado.nombre,' ', empleado.apellido);
			writeln('edad ', empleado.edad, ', DNI ', empleado.dni);
			writeln('numero de empelado ', empleado.numeroEmpleado);
		end;
	end;
end;

procedure listarEmpleados(var arch: archivo);
var
	d: data;
begin
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

var
	arch: archivo;
	nomFis: string;
	opcion: integer;
begin
	
	writeln('Seleccione el numero de la opcion elegida');
	writeln('1_ Crear archivo');
	writeln('2_ Abrir archivo');
	readln(opcion);
	
	writeln('Ingrese el nombre del archivo');
	readln(nomFis);
	assign(arch, nomFis);
	
	if(opcion = 1) then begin
		reWrite(arch);
		reset(arch);
		agregarEmpelados(arch);
		close(arch);
	end else begin
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
end.
