Program ejercicio16;
const 
	valorAlto = 999;
	tope = 100;
type
	data = record
		fecha: integer;
		codSemi: integer;
		nomSemi: string[50];
		desc: string[50];
		precio: real;
		totalEjemp: integer;
		totalVendidos: integer;
	end;
	
	dataD = record
		fecha: integer;
		codSemi: integer;
		cantVendidos: integer;
	end;
	
	maestro = file of data;
	detalle = file of dataD;
	
	detalles =array[1..tope] of detalle;
	registro = array[1..tope] of dataD;
	
procedure actualizarMaestro(var mae: maestro; var det: detalles);
	procedure leerDetalle(var det: detalle; var reg: dataD);
	begin
		if(not eof(det)) then begin
			read(det, reg);
		end else begin
			reg.fecha:= valorAlto;
		end;
	end;
	
	procedure leerMaestro(var mae: maestro; var d: data);
	begin
		if(not eof(mae)) then begin
			read(mae, d);
		end else begin
			d.fecha:= valorAlto;
		end;
	end;
	
	procedure minimo(var det: detalles; var reg: registro; var min: dataD);
	var
		i, pos: integer;
	begin
		min.fecha:= valorAlto;
		min.codSemi:= valorAlto;
		for i:= 1 to tope do begin
			if(reg[i].fecha < min.fecha) or ((reg[i].fecha = min.fecha) and (reg[i].codSemi < min.codSemi)) then begin
				min:= reg[i];
				pos:= i;
			end;
		end;
		
		if(min.fecha <> valorAlto) then begin
			leerDetalle(det[pos], reg[pos]);
		end;
	end;

	procedure buscarMin(cod, totalVendidos, fecha: integer; var totalMin, semiMin, fechaMin: integer);
	begin
		if(totalVendidos < totalMin) then begin
			totalMin:= totalVendidos;
			semiMin:= cod;
			fechaMin:= fecha;
		end;
	end;
	
	procedure buscarMax(cod, totalVendidos, fecha: integer; var totalMax, semiMax, fechaMax: integer);
	begin
		if(totalVendidos > totalMax) then begin
			totalMax:= totalVendidos;
			semiMax:= cod;
			fechaMax:= fecha;
		end;
	end;
	
var
	reg: registro;
	d: data;
	i, totalMin, totalMax, semiMin, semiMax, fechaMin, fechaMax, actFecha, actSemi: integer;
	min: dataD;
begin
	totalMin:= 9999;
	totalMax:= -1;
	for i:= 1 to tope do begin
		reset(det[i]);
		leerDetalle(det[i], reg[i]);
	end;
	reset(mae);
	
	minimo(det, reg, min);
	while(min.fecha <> valorAlto) do begin
		leerMaestro(mae, d);
		
		while(d.fecha <> min.fecha) or (d.codSemi <> min.codSemi) do begin
			leerMaestro(mae ,d);
		end;
	
		actFecha:= min.fecha;
		
		while(min.fecha <> valorAlto) and (actFecha = min.fecha) do begin
			actSemi:= min.codSemi;
			
			while(min.fecha <> valorAlto) and (actFecha = min.fecha) and (actSemi = min.codSemi) do begin
				if(d.totalEjemp > min.cantVendidos) then begin
					d.totalEjemp:= d.totalEjemp - min.cantVendidos;
					d.totalVendidos:= d.totalVendidos + min.cantVendidos;
				end;
				minimo(det, reg, min);
			end;
			
			buscarMin(d.codSemi, d.totalVendidos, d.fecha, totalMin, semiMin, fechaMin);
			buscarMax(d.codSemi, d.totalVendidos, d.fecha, totalMax, semiMax, fechaMax);
			seek(mae, filepos(mae)-1);
			write(mae, d);
		end;
	end;

	writeln('El seminario con menos ventas es ',semiMin,' en la fecha ',fechaMin);
	writeln('El seminario con mas ventas es ',semiMAx,' en la fecha ',fechaMax);
	
	for i:= 1 to tope do begin
		close(det[i]);
	end;
	close(mae);
end;

var
	mae: maestro;
	det: detalles;
	i: integer;
	istr: string[3];
begin
	for i:=1 to tope do begin
		str(i, istr);
		assign(det[i], 'detalle' + istr);
	end;
	assign(mae, 'maestro');
	
	actualizarMaestro(mae, det);
	
end.
