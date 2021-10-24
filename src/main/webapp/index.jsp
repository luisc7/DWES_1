<%@page import="java.util.ArrayList"%>
<%@page import="modelo.beans.Evento"%>
<%@page import="java.util.List"%>
<%@page import="modelo.daos.EventoListImpl"%>
<%@page import="modelo.daos.IntEventoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" media="screen" href="css/style.css"/>
<title>Eventos</title>
</head>
<body>

	<% 
		// Obtener el objeto que contiene la lista de eventos
		HttpSession sesion = request.getSession();
		IntEventoDao ievent = (IntEventoDao)sesion.getAttribute("interEventos");
		
		// Extraer los eventos activos a una lista
		List<Evento> listAll = new ArrayList<Evento>();
		listAll = ievent.findAll();
	%>
	<nav>
		<ul>
			<li><a>Tipos</a></li>
			<li><a>Eventos</a></li>
			<li><a>Usuarios</a></li>
			<li class="active"><a>Eventos/tipo</a></li>
			<li><a>Login</a></li>
			<li><a>Registro</a></li>
			<li><a>Salir</a></li>
		</ul>
	</nav>
	<h1>Listado de todos los eventos</h1>
	<div class="boton"><a href=activos.jsp>Ver sólo eventos activos</a></div>
	<table>
		<tr>
			<th class="col1">Id</th>
			<th class="col2">Nombre</th>
			<th class="col3">Precio</th>			
			<th class="col4">Estado</th>
			
			
			<th class="col5-6-7" colspan="3">Opciones</th>
		</tr>
		<% 
			for (Evento event: listAll) { 
		%>
		<tr>
			<td class="col1 filled-col"><%=event.getIdEvento() %></td>
			<td class="col2 filled-col"><%=event.getNombre() %></td>
			<td class="col3 filled-col"><%=event.getPrecio() %></td>
			<td class="col4 filled-col"><%=event.getEstado() %></td>
			<td class="col5 filled-col"><a href="eventos?opcion=editar&id=<%=event.getIdEvento() %>">Editar</a></td>
			<td class="col6 filled-col"><a href="eventos?opcion=eliminar&id=<%=event.getIdEvento() %>">Eliminar</a></td>
			<% if (event.getEstado()=="Activo") {%>
			
			<td class="col7 filled-col"><a href="eventos?opcion=cancelar&id=<%=event.getIdEvento() %>">Cancelar</a></td>
			<%} else { %>
			<td class="col7 filled-col"><a href="eventos?opcion=activar&id=<%=event.getIdEvento() %>">Activar</a></td>
			<%} %>
		</tr>
		<% } %>
	</table>

	
	
	<div class="boton"><a href=form.jsp>Nuevo evento</a></div>
</body>
</html>