program ejercicio14;
const 
	valorAlto = 'ZZZZZZ';
type
	data = record
		destino: string[40];
		fecha: integer;
		horaSalida:integer;
		asientos: integer;
	end;
	
	lista = ^nodo;
	
	nodo = record
		d: data;
		sig: lista;
	end;
	
	archivo = file of data;
	
procedure actualizarMaestro(var mae: archivo; var det1, det2: archivo; var l: lista);
	procedure leerArchivo(var a: archivo; var d: data);
	begin
		if(not eof(a)) then begin
			read(a, d);
		end else begin
			d.destino:= valorAlto;
		end;
	end;
	procedure minimo(var det1, det2: archivo; var reg1, reg2, min: data);
	begin
		if(reg1.destino <> valorAlto) or (reg2.destino <> valorAlto) then begin
			if(reg1.destino < reg2.destino) or((reg1.destino = reg2.destino) and (reg1.fecha < reg2.fecha)) or ((reg1.destino = reg2.destino) and (reg1.fecha = reg2.fecha) and (reg1.horaSalida < reg2.horaSalida)) then begin
				min:= reg1;
				leerArchivo(det1, reg1);
			end else begin
				min:= reg2;
				leerArchivo(det2, reg2);
			end;
		end;
	end;
	
	procedure compararMinimo(var l: lista; aux: integer; d: data);
	var
		nue: lista;
	begin
		if(d.asientos < aux) then begin
			new(nue);
			nue^.d:= d;
			nue^.sig:= l;
			l:= nue;
		end;
	end;
		
var
	d, reg1, reg2, min: data;
	actDest: string[40];
	actFecha, totalVendidos, actSalida, aux: integer;
begin
	reset(mae);
	reset(det1);
	reset(det2);
	leerArchivo(det1, reg1);
	leerArchivo(det2, reg2);
	minimo(det1, det2, reg1, reg2, min);
	
	writeln('Indique el minimo de asientos disponibles a informar');
	readln(aux);
	while(min.destino <> valorAlto) do begin
		leerArchivo(mae, d);
		
		while(min.destino <> d.destino) or (min.horaSalida <> d.horaSalida) or (min.fecha <> d.fecha) do begin
			compararMinimo(l, aux, d);
			leerArchivo(mae, d);
		end;
		actDest:= min.destino;
		while(min.destino <> valorAlto) and (min.destino = actDest) do begin
			actFecha:= min.fecha;
			while(min.destino <> valorAlto) and (min.destino = actDest) and (min.fecha = actFecha) do begin
				actSalida:= min.horaSalida;
				totalVendidos:= 0;
				while(min.destino <> valorAlto) and (min.destino = actDest) and (min.Fecha = actFecha) and (min.horaSalida = actSalida) do begin
					totalVendidos:= totalVendidos + min.asientos;
					minimo(det1, det2, reg1, reg2, min);
				end;
				
				if(totalVendidos < d.asientos) then begin
					seek(mae, filepos(mae) -1);
					d.asientos:= d.asientos - totalVendidos;
					compararMinimo(l, aux, d);
					write(mae, d);
				end else begin
					writeln('El vuelo con destino a ',actDest,' del dia ',actFecha,' tine sobreventa y no se registraron sus pasajes');
				end;
			end;
		end;
	end;
	while(d.destino <> valorAlto) do begin
		compararMinimo(l, aux, d);
		leerArchivo(mae, d);
	end;
end;

var
	mae: archivo;
	det1, det2: archivo;
	l: lista;
begin
	l:= nil;
	assign(mae, 'maestro');
	assign(det1, 'detalle1');
	assign(det2, 'detalle2');
	
	actualizarMaestro(mae, det1, det2, l);

end.
	
