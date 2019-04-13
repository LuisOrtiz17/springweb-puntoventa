<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
<link rel="stylesheet" href='<c:url value="/res/css/bootstrap.min.css" />' />
<title>Insert title here</title>
</head>
<body>

Language : <a href="?lang=en">English</a>|<a href="?lang=es">Español</a>

<h1><s:message code="bienvenido" /></h1>

Current Locale : ${pageContext.response.locale}

<sec:authorize access="!isAuthenticated()">

  <div class="container">
    <div class="row">
      <div class="col-12">
        <img src='<c:url value="/res/images/img1.png" />'>
      </div>
      <div class="col-12">
        <h1>Sistema de punto de venta</h1> 
        <p></p> 
        <a href="<c:url value='/acceso'/>" class="btn btn-primary">Iniciar sesión</a> 
      </div>
    </div>
  </div>

</sec:authorize>

<sec:authorize access="isAuthenticated()">	
	<c:import url="/WEB-INF/views/menu.jsp"></c:import>	
</sec:authorize>

<script type="text/javascript" src='<c:url value="/res/js/jquery.js" />'></script>
<script type="text/javascript" src='<c:url value="/res/js/popper.min.js" />'></script>
<script type="text/javascript" src='<c:url value="/res/js/bootstrap.min.js" />'></script>  
</body>
</html>