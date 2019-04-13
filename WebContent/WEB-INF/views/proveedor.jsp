<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href='<c:url value="/res/css/bootstrap.min.css" />' />

<title>Insert title here</title>
<style type="text/css" ></style>
</head>
<body>
	<c:import url="/WEB-INF/views/menu.jsp"></c:import>
	<br />
	<div class="container mt-5">
	<h1 class="text-primary text-center">Proveedores</h1>
	<c:if test="${mensaje != null }">
	<div class="alert alert-warning alert-dismissible fade show" role="alert">	
	
	<p id="parrafoMensaje"><s:message code="${mensaje}" /><p>
		
  			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    		<span aria-hidden="true">&times;</span>
  			</button>
	</div>
	</c:if>
	</div>
	<div class="container mt-5">
		<div class="row">
			<div class="col-3">
				<ul class="nav">
				  <li class="nav-item">
				    <a class="nav-link" href="<c:url value='/proveedor/findAll'/>">Listar Proveedores</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#" onclick="mostrarModalGuardar();">Registrar nuevo Proveedor</a>
				  </li>				  
				</ul>										 					
			</div>
			<div class="col-9">
				<c:if test="${listProveedor ne null}">
					<table id="tablaProducto" class="table table-hover table-sm">
						<thead>
							<tr>						
							<th>Id Proveedor</th>
							<th>Descripci&oacute;n</th>		
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${listProveedor}" var="item">
							<tr ondblclick="mostrarProveedor(this);"><td>${item.idproveedor}</td><td>${item.descripcion}</td></tr>
						</c:forEach>
						</tbody>
					</table>
				</c:if>
			</div>
		</div>							
	</div>



<!-- Modales -->
<div class="modal fade bd-guardar-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Registrar proveedor</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container">  
		    <div class="row">
		    	<div class="col">
			      	<div class="alert alert-warning alert-dismissible fade show" role="alert">		
		  			<p id="parrafoGuardar">${mensaje}<p>
		  			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    		<span aria-hidden="true">&times;</span>
		  			</button>
				</div>
				</div>
			</div>
			<div class="row">
		      <div class="col">		      		       	
		       	  <div class="form-group">
		            <label for="textIdProveedor">Id Proveedor:</label>            
		            <input type="text" id="textIdProveedor" class="form-control" placeholder="">
		          </div>		       	 	       
		          <div class="form-group">
		            <label for="textDescripcionProveedor">Descripción Proveedor:</label>            
		            <input type="text" id="textDescripcionProveedor" class="form-control" placeholder="">
		          </div>			        
		      </div>      
		    </div>
  		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="saveProveedor();">Guardar</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade bd-modificar-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modificar producto</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
       <div class="modal-body">
          <div class="container">  
		    <div class="row">
		    	<div class="col">
			      	<div class="alert alert-warning alert-dismissible fade show" role="alert">		
		  			<p id="parrafoModificar">${mensaje}<p>
		  			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    		<span aria-hidden="true">&times;</span>
		  			</button>
				</div>
				</div>
			</div>
			<div class="row">
		      <div class="col">		      		       	
		       	  <div class="form-group">
		            <label for="textIdProveedorModificar">Id Proveedor:</label>            
		            <input type="text" id="textIdProveedorModificar" class="form-control" placeholder="" disabled>
		          </div>		       	 	       
		          <div class="form-group">
		            <label for="textDescripcionProveedorModificar">Descripción Proveedor:</label>            
		            <input type="text" id="textDescripcionProveedorModificar" class="form-control" placeholder="">
		          </div>			        
		      </div>      
		    </div>
  		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="updateProveedor();">Modificar</button>
        <button type="button" class="btn btn-danger" onclick="deleteProveedor();">Eliminar</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript" src='<c:url value="/res/js/jquery.js" />'></script>
<script type="text/javascript" src='<c:url value="/res/js/popper.min.js" />'></script>
<script type="text/javascript" src='<c:url value="/res/js/bootstrap.min.js" />'></script>
<script type="text/javascript" src='<c:url value="/res/js/proveedor.js" />'></script>  
</body>
</html>