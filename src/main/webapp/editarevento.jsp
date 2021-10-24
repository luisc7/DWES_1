<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.beans.Evento"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" media="screen" href="css/style.css"/>
<title>Insert title here</title>
</head>
<body>
	<% 
		// Obtener el evento a editar (mostrar)
		Evento evento = (Evento)request.getAttribute("evento");
	
		/*
		* Si realmente quisieramos editar, habría que obtener el objeto 
		* que contiene la lista de eventos para luego actualizarla
		HttpSession sesion = request.getSession();
		List<Evento> listEvent = new ArrayList<Evento>();
		listEvent = (List<Evento>)sesion.getAttribute("interEventos");*/
	%>
	<h1>Editar evento</h1>
	<p class="boton"><a href="eventos?opcion=activos">Volver a lista de eventos activos</a></p>
	<table class="modif">
		<tr>
			<th>Identificador</th>
			<th>Tipo de evento</th>
			<th>Nombre</th>
			<th>Descripción</th>
			<th>Inicio</th>
			<th>Duración (h)</th>
			<th>Dirección</th>
			<th>Estado</th>
			<th>¿Destacado?</th>
			<th>Máximo asistentes</th>
			<th>Mínimo asistentes</th>
			<th>Precio (Euros)</th>
		</tr>
		<tr>
			<td><%=evento.getIdEvento() %></td>
			<td><%=evento.getIdTipo().getNombre() %></td>
			<td><%=evento.getNombre() %></td>
			<td><%=evento.getDescripcion() %></td>
			<td><%=evento.getFechaInicio() %></td>
			<td><%=evento.getDuracion() %></td>
			<td><%=evento.getDireccion() %></td>
			<td><%=evento.getEstado() %></td>
			<td><%=evento.getDestacado() %></td>
			<td><%=evento.getAforoMaximo() %></td>
			<td><%=evento.getMinimoAsistencia() %></td>
			<td><%=evento.getPrecio() %></td>
		</tr>
	</table>
</body>
</html>