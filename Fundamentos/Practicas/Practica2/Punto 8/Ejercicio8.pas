Program ejercicio8;
const 
	valorAlto = 999;
type
	data = record
		codProv: integer;
		nomProv: string[30];
		habitantes: integer;
		total: real;
	end;
	
	dataD = record
		codProv: integer;
		total: real;
	end;
		
	maestro = file of data;
	detalle = file of dataD;
	
	vectorDet = array[1..16] of detalle;
	vectorReg = array[1..16] of dataD;
	
procedure actualizarMaestro(var mae: maestro; var det: vectorDet);
	procedure leerDetalle(var det: detalle; var reg: dataD);
	begin
		if(not eof(det))then begin
			read(det, reg);
		end else begin
			reg.codProv:= valorAlto;
		end;
	end;
	
	procedure informarProvincia(d: data);
	begin
		if(d.total > 10000) then begin
			writeln('La provincia ', d.nomProv,' codigo ', d.codProv,' tiene un consumo historico mayor a 10000kg');
		end;
	end;
	
	procedure minimo(var det: vectorDet; var reg: vectorReg; var min: dataD);
	var
		i, pos: integer;
	begin
		min.codProv:= valorAlto;
		for i:=1 to 16 do begin
			if(reg[i].codProv < min.codProv) then begin
				min:= reg[i];
				pos:= i;
			end;
		end;
		
		if(min.codProv <> valorAlto) then begin
			leerDetalle(det[pos], reg[pos]);
		end;
	end;
var
	i, codAct: integer;
	reg: vectorReg;
	min: dataD;
	d: data;
begin
	for i:=1 to 10 do begin
		reset(det[i]);
		leerDetalle(det[i], reg[i]);
	end;
	reset(mae);
	
	minimo(det, reg, min);
	
	while(min.codProv <> valorAlto) do begin
		read(mae, d);
		codAct:= min.codProv;
		while(d.codProv <> min.codProv) do begin
			informarProvincia(d);
			read(mae, d);
		end;
		
		while(codAct = min.codProv) do begin
			d.total:= d.total + min.total;
			minimo(det, reg, min);
		end;
		
		informarProvincia(d);
		seek(mae, filepos(mae)-1);
		write(mae, d);
	end;
	
	
	
	for i:=1 to 16 do begin
		close(det[i]);
	end;
	close(mae);
end;

var
	mae: maestro;
	det: vectorDet;
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
	assign(det[11], 'detalle11');
	assign(det[12], 'detalle12');
	assign(det[13], 'detalle13');
	assign(det[14], 'detalle14');
	assign(det[15], 'detalle15');
	assign(det[16], 'detalle16');
	assign(mae, 'maestro');
	
	actualizarMaestro(mae, det);
end.
