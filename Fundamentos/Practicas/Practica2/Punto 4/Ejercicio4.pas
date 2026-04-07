program Ejercicio4;
const 
	valorAlto = 999;
type
	data = record
		cod: integer;
		nombre: string[50];
		descripcion: string[100];
		stockActual: integer;
		stockMinimo: integer;
		precio: real;
	end;
	
	dataD = record
		cod: integer;
		cant: integer;
	end;
	
	maestro = file of data;
	detalle = file of dataD;
	
	minimos = array[1..8] of dataD;
	
procedure actualizarMaestro(var mae: maestro; var det1, det2, det3, det4, det5, det6, det7, det8: detalle);
	procedure leerDetalle(var det: detalle;var d: dataD);
	begin
		if(not eof(det)) then begin
			read(det, d);
		end else begin
			d.cod:= valorAlto;
		end;
	end;
	
	procedure minimo(var det1, det2, det3, det4, det5, det6, det7, det8: detalle; var d1, d2, d3, d4, d5, d6, d7, d8, min: dataD; var v: minimos);
		procedure cargarVector(var v: minimos; d1, d2, d3, d4, d5, d6, d7, d8: dataD);
		begin
			v[1]:= d1;
			v[2]:= d2;
			v[3]:= d3;
			v[4]:= d4;
			v[5]:= d5;
			v[6]:= d6;
			v[7]:= d7;
			v[8]:= d8;
		end;
	var
		i, aux: integer;
	begin
		cargarVector(v, d1, d2, d3, d4, d5, d6, d7, d8);
		min.cod:= valorAlto;
		for i:=1 to 8 do begin
			if(v[i].cod < min.cod) then begin
				min:= v[i];
				aux:= i;
			end;
		end;
		
		case aux of 
			1: leerDetalle(det1, d1);
			2: leerDetalle(det2,d2);
			3: leerDetalle(det3,d3);
			4: leerDetalle(det4,d4);
			5: leerDetalle(det5,d5);
			6: leerDetalle(det6,d6);
			7: leerDetalle(det7,d7);
			8: leerDetalle(det8,d8);
		end;
	end;
		
var
	d: data;
	regd1, regd2, regd3, regd4, regd5, regd6, regd7, regd8, min: dataD;
	v: minimos;
begin
	reset(mae);
	reset(det1);
	reset(det2);
	reset(det3);
	reset(det4);
	reset(det5);
	reset(det6);
	reset(det7);
	reset(det8);
	
	leerDetalle(det1, regd1);
	leerDetalle(det2, regd2);
	leerDetalle(det3, regd3);
	leerDetalle(det4, regd4);
	leerDetalle(det5, regd5);
	leerDetalle(det6, regd6);
	leerDetalle(det7, regd7);
	leerDetalle(det8, regd8);
	
	minimo(det1, det2, det3, det4, det5, det6, det7, det8, regd1, regd2, regd3, regd4, regd5, regd6, regd7, regd8, min, v);
	
	while(min.cod <> valorAlto) do begin
		read(mae, d);
		
		while(min.cod <> d.cod) do begin
			read(mae, d);
		end;
		
		while(min.cod = d.cod) do begin
			d.stockActual:= d.stockActual - min.cant;
			minimo(det1, det2, det3, det5, det5, det6, det7, det8, regd1, regd2, regd3, regd4, regd5, regd6, regd7, regd8, min, v);
		end;
		
		seek(mae, filepos(mae) -1);
		write(mae, d);
	end;
	close(mae);
	close(det1);
	close(det2);
	close(det3);
	close(det4);
	close(det5);
	close(det6);
	close(det7);
	close(det8);
end;
	
var
	mae: maestro;
	det1, det2, det3, det4, det5 ,det6, det7, det8: detalle;
begin
	assign(mae, 'maestro');
	assign(det1, 'detalle1');
	assign(det1, 'detalle2');
	assign(det1, 'detalle3');
	assign(det1, 'detalle4');
	assign(det1, 'detalle5');
	assign(det1, 'detalle6');
	assign(det1, 'detalle7');
	assign(det1, 'detalle8');
	
	{writeln('---SE GENERA EL ARCHIVO MAESTRO---');
	generarMaestro(mae);
	writeln ('---SE GENERAN LOS ARHIVOS DETALLE---');
	generarDetalle(det1);
	generarDetalle(det2);
	generarDetalle(det3);
	generarDetalle(det4);
	generarDetalle(det5);
	generarDetalle(det6);
	generarDetalle(det7);
	generarDetalle(det8);}
	
	actualizarMaestro(mae, det1, det2, det3, det4, det5, det6, det7, det8);

end.
	
