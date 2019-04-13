<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
    <link rel="stylesheet" href='<c:url value="/res/css/bootstrap.min.css" />' />
<title>Insert title here</title>
</head>
<body>
<div class="container">
<div class="row">
<div class="col-4">
	<h2>Acceso a usuario ${param.error}</h2>
	<c:if test="${param.error != null}">
		<span style="color:red;">¡Error de credenciales!</span>
	</c:if>
	<form action='<c:url value="/login" />' method='POST'>
	
		<div class="form-group">
    		<label for="exampleInputEmail1">Usuario:</label>
    		<input type="text" class="form-control" name="usuario" placeholder="Usuario">    		
  		</div>
 		<div class="form-group">
    		<label for="exampleInputPassword1">Contraseña:</label>
    		<input type="password" name="clave" class="form-control" placeholder="Password">
  		</div>  		
  		<button type="submit" class="btn btn-primary">Accesar</button>		
	</form>
</div>		
</div>	
</div>		
<script type="text/javascript" src='<c:url value="/res/js/jquery.js" />'></script>
<script type="text/javascript" src='<c:url value="/res/js/popper.min.js" />'></script>
<script type="text/javascript" src='<c:url value="/res/js/bootstrap.min.js" />'></script> 
</body>
</html>