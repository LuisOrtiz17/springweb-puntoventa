<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sec:authentication property="principal" var="principal"/>
<c:set var="username" value="${principal.username}"/>

<input type="hidden" id="path" value="${pageContext.request.contextPath}"/>
<!-- SECCION NAVEGACIÓN-->
<nav class="navbar navbar-dark bg-dark navbar-expand fixed-top">
  <div class="container">      
    <p class="text-white">
      <strong>Bienvenido ${username}</strong>
    <p>

    <div id="menu-principal">
      <ul class="navbar-nav">
        <li class="nav-item"><a href="<c:url value='/proveedor'/>" class="nav-link">Proveedores</a></li>
        <li class="nav-item"><a href="<c:url value='/usuario'/>" class="nav-link">Administración de usuarios</a></li>
        <li class="nav-item"><a href="<c:url value='/ventas'/>" class="nav-link">Ventas</a></li>
        <li class="nav-item"><a href="<c:url value='/logout'/>" class="nav-link">Cerrar sesión</a></li>        
      </ul>
    </div>
  </div>
</nav>
