Program ejercicio6;
const
	valorAlto = 999;
type
	data = record
		codLoc: integer;
		codCepa: integer;
		casosActivos: integer;
		casosNuevos: integer;
		recu: integer;
		fallecidos: integer;
	end;
	
	detalle = file of data;
	
	dataM = record
		codLoc: integer;
		nomLoc: string[50];
		codCepa: integer;
		nomCepa: string[50];
		casosActivos: integer;
		casosNuevos: integer;
		recu: integer;
		fallecidos: integer;
	end;
	
	maestro = file of dataM;
	
	vectorDet = array[1..10] of detalle;
	vectorReg = array[1..10] of data;
	
procedure generarDetalle(var det: detalle);
	procedure leer(var d: data);
	begin
		writeln('Ingrese el codigo de localidad');
		readln(d.codLoc);
		writeln('Ingrese el codigo de cepa');
		readln(d.codCepa);
		writeln('Ingrese la cantidad de casos activos');
		readln(d.casosActivos);
		writeln('Ingrese la cantidad de casos nuevos');
		readln(d.casosNuevos);
		writeln('Ingrese la cantidad de pacientes recuperados');
		readln(d.recu);
		writeln('Ingrese la cantidad de pacientes fallecidos');
		readln(d.fallecidos);
	end;
var
	d: data;
	i: integer;
begin
	reWrite(det);
	for i:= 1 to 5 do begin
		leer(d);
		write(det, d);
	end;
	close(det);
end;

procedure generarMaestro(var mae: maestro);

var
	d: dataM;
begin
	reWrite(mae);
	
	writeln('Ingrese el codigo de localidad');
	readln(d.codLoc);
	writeln('Ingrese el nombre de la localidad');
	readln(d.nomLoc);
	writeln('Ingrese el codigo de cepa');
	readln(d.codCepa);
	writeln('Ingrese el nombre de la cepa');
	readln(d.nomCepa);
	writeln('Ingrese la cantidad de casos activos');
	readln(d.casosActivos);
	writeln('Ingrese la cantidad de casos nuevos');
	readln(d.casosNuevos);
	writeln('Ingrese la cantidad de pacientes recuperados');
	readln(d.recu);
	writeln('Ingrese la cantidad de pacientes fallecidos');
	readln(d.fallecidos);
	
	write(mae, d);
	close(mae);
end;

procedure actualizarMaestro(var mae: maestro; var det: vectorDet);
	procedure leerArchivo(var det: detalle; var d: data);
	begin
		if(not eof(det)) then begin
			read(det, d);
		end else begin
			d.codLoc:= valorAlto;
			d.codCepa:= valorAlto;
		end;
	end;
	
	procedure minimo(var det: vectorDet; var regD: vectorReg; var min: data);
	var
		i, minI: integer;
	begin
		min.codLoc:= valorAlto;
		min.codCepa:= valorAlto;
		for i:=1 to 10 do begin			
			if(regD[i].codLoc < min.codLoc) or ((regD[i].codLoc = min.codLoc) and (regD[i].codCepa < min.codCepa)) then begin
				min:= regD[i];
				minI:= i;
			end;
		end;
		if(min.codLoc <> valorAlto) then begin
			leerArchivo(det[minI], regD[minI]);
		end;
	end;
var
	regD: vectorReg;
	d: dataM;
	min: data;
	locAct, cepaAct, i, total: integer;
begin
	for i:=1 to 10 do begin
		reset(det[i]);
		leerArchivo(det[i], regD[i]);
	end;
	reset(mae);
	minimo(det, regD, min);
	
	while(min.codLoc <> valorAlto) do begin
		locAct:= min.codLoc;
		total:= 0;
		read(mae, d);
		
		while(min.codLoc <> d.codLoc) do begin
			read(mae, d);
		end;
		
		while(min.codLoc = locAct) do begin
			cepaAct:= min.codCepa;
			total:= 0;
			while(min.codCepa <> d.codCepa) do begin
				read(mae, d);
			end;
			
			while(min.codCepa = cepaAct) do begin
				d.fallecidos:= d.fallecidos + min.fallecidos;
				d.recu:= d.recu + min.recu;
				d.casosActivos:= min.casosActivos;
				d.casosNuevos:= min.casosNuevos;
				minimo(det, regD, min);
			end;
			total:= d.casosActivos + total;
			seek(mae, filepos(mae) -1);
			write(mae, d);
			
		end;
		if (total > 50) then begin
			writeln('La localidad ',locAct,' tiene ', total,' casos activos');
		end;
	end;
	
	for i:= 1 to 10 do begin
		close(det[i]);
	end;
	close(mae);
end;
var
	mae: maestro;
	det: vectorDet;
	i:integer;
begin
	assign(det[1], 'detalle1');
	assign(det[2],'detalle2');
	assign(det[3], 'detalle3');
	assign(det[4], 'detalle4');
	assign(det[5], 'detalle5');
	assign(det[6], 'detalle6');
	assign(det[7], 'detalle7');
	assign(det[8], 'detalle8');
	assign(det[9], 'detalle9');
	assign(det[10], 'detalle10');
	assign(mae, 'maestro');
	
	writeln('---SE GENERA EL MAESTRO---');
	generarMaestro(mae);

	for i:=1 to 10 do begin
		writeln('---SE GENERA UN DETALLE---');
		generarDetalle(det[i]);
	end;
	
	actualizarMaestro(mae, det);
end.
