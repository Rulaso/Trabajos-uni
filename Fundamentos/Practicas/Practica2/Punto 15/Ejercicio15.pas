Program ejercicio15;
const 
	valorAlto = 9999;
type
	data = record
		codProv: integer;
		nomProv: string[30];
		codLoc: integer;
		nomLoc: string[30];
		vivLuz: integer;
		vivGas: integer;
		vivConst: integer;
		vivAgua: integer;
		vivSanitarios: integer;
	end;
	
	archivo = file of data;
	
	detalle = array[1..10] of archivo;
	registro = array[1..10] of data;
	
procedure actualizarMaestro(var mae: archivo; var det: detalle);
	procedure leerArchivo(var a: archivo; var d: data);
	begin
		if(not eof(a)) then begin
			read(a, d);
		end else begin
			d.codProv:= valorAlto;
		end;
	end;
	
	procedure minimo(var det: detalle; var reg: registro; var min: data);
	var
		i, pos: integer;
	begin
		min.codProv:= valorAlto;
		min.codLoc:= valorAlto;
		for i:= 1 to 10 do begin
			if(reg[i].codProv < min.codProv) or ((reg[i].codProv = min.codProv) and (reg[i].codLoc < min.codLoc)) then begin
				min:= reg[i];
				pos:= i;
			end;
		end;
		
		if(min.codProv <> valorAlto) then begin
			leerArchivo(det[pos], reg[pos]);
		end;
	end;
	
	procedure contarViviendas(act: integer; var cant: integer);
	begin
		if(act = 0) then begin
			cant:= cant+1;
		end;
	end;
var
	i, cant: integer;
	reg: registro;
	min, d: data;
	actLoc, actProv: integer;
begin
	cant:= 0;
	for i:=1 to 10 do begin
		reset(det[i]);
		leerArchivo(det[i], reg[i]);
	end;
	reset(mae);
	
	minimo(det, reg, min);
	while(min.codProv <> valorAlto) do begin
		leerArchivo(mae, d);
		
		while(d.codProv <> min.codProv) or (d.codLoc <> min.codLoc) do begin
			contarViviendas(d.vivConst, cant);
			leerArchivo(mae, d);
		end;
		actProv:= min.codProv;
		while(min.codProv <> valorAlto) and (actProv = min.codProv) do begin
			actLoc:= min.codLoc;
			
			while(min.codProv <> valorAlto) and (actProv = min.codProv) and (actLoc = min.codLoc) do begin
				d.vivLuz:= d.vivLuz - min.vivLuz;
				d.vivGas:= d.vivGas - min.vivGas;
				d.vivConst:= d.vivConst - min.vivConst;
				d.vivAgua:= d.vivAgua - min.vivAgua;
				d.vivSanitarios:= d.vivSanitarios - min.vivSanitarios;
				minimo(det, reg, min);
			end;
			contarViviendas(d.vivConst, cant);
			seek(mae, filepos(mae)-1);
			write(mae, d);
		end;
	end;
	leerArchivo(mae, d);
	while(d.codProv <> valorAlto) do begin
		contarViviendas(d.vivConst, cant);
		leerArchivo(mae, d);
	end;
end;				

var
	mae: archivo;
	det: detalle;
begin
	assign(det[1], 'detalle1');
	assign(det[2], 'detalle2');
	assign(det[3], 'detalle3');
	assign(det[4], 'detalle4');
	assign(det[5], 'detalle5');
	assign(det[6], 'detalle6');
	assign(det[7], 'detalle7');
	assign(det[8], 'detalle8');
	assign(det[9], 'detalle9');
	assign(det[10], 'detalle10');
	assign(mae, 'maestro');
	
	actualizarMaestro(mae, det);
end.
