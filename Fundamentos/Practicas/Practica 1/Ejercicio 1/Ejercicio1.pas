Program Ejercicio1;
type
	archivo = file of integer;
var
	arch: archivo;
	nomFis: string;
	i, num: integer;
begin
	i:= 0;
	writeln('Ingrese un nombre para el archivo');
	readln(nomFis);
	
	assign(arch, nomFis);
	
	reWrite(arch);
	reset(arch);
	
	writeln('Ingrese un numero');
	readln(num);
	
	while(num <> 300) and (i < 30) do begin
		write(arch, num);
		i:= i+1;
		writeln('Ingrese un numero');
		readln(num);
	end;
	
	writeln('El tamaño del archivo es ',fileSize(arch));
	
	close(arch);
	
end.

