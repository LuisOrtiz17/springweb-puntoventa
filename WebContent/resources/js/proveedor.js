"use strict";

function saveProveedor(){
	let idproveedor = $('#textIdProveedor').val();
	let descripcion = $('#textDescripcionProveedor').val();
	
	let proveedor = {
			"idproveedor": idproveedor,
			"descripcion": descripcion
	};	
	
	let url = "/springweb-puntoventa/proveedor/ajax/save";  
	$.ajax({
		url: url,
		type : "POST",
		contentType : "application/json",		
		data : JSON.stringify(proveedor),			
		success: function (data) {
			$('#parrafoGuardar').text(data);
		}        
	});
}

function mostrarProveedor(fila){
	$('.bd-modificar-modal-lg').modal('show');
	let idproveedor = $('td:eq(0)', fila).text();
	
	let url = "/springweb-puntoventa/proveedor/ajax/findByIdProveedor";  
	$.ajax({
		url: url,		
		type : "POST",
		contentType : "application/json",		
		data : idproveedor,
		success: function (data) {
			$('#textIdProveedorModificar').val(data.idproveedor);
			$('#textDescripcionProveedorModificar').val(data.descripcion);						
			console.log(data);
		}        
	});		
	
}

function deleteProveedor(){
	let idproveedor = $('#textIdProveedorModificar').val();
	
	let url = "/springweb-puntoventa/proveedor/ajax/delete";  
	$.ajax({
		url: url,		
		type : "POST",
		contentType : "application/json",		
		data : idproveedor,
		success: function (data) {
			$('#parrafoModificar').text(data);
		}        
	});		
	
}

function updateProveedor(){
	let idproveedor = $('#textIdProveedorModificar').val();
	let descripcion = $('#textDescripcionProveedorModificar').val();
	
	
	let proveedor = {
			"idproveedor": idproveedor,
			"descripcion": descripcion
	};
	
	let url = "/springweb-puntoventa/proveedor/ajax/update";  
	$.ajax({
		url: url,
		type : "POST",
		contentType : "application/json",		
		data : JSON.stringify(proveedor),			
		success: function (data) {
			$('#parrafoModificar').text(data);
		}        
	});
}

function mostrarModalGuardar(){
	$('.bd-guardar-modal-lg').modal('show');
}

$( document ).ready(function() {

});