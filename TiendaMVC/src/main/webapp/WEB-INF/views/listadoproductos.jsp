<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href='<c:url value="/resources/css/styles.css" />' media="all" />
	<title>Listado de Productos</title>
</head>
<body>
<div class="CSSTable">
	<table><tr><th>Producto</th><th>Precio</th><th>Abrir</th><th>Ver</th></tr>
		<c:forEach items="${productos }" var="prod">
			<tr>
				<td>${prod.nombre }</td>
				<td>${prod.precio } €</td>
				<td><a href="detalle-${prod.idProducto}.html"> Abrir Detalle </a></td>
				<td><a href="#" id="lnkDetalle" onclick="evento(${prod.idProducto})"> Ver Detalle </a></td>
			</tr>
		</c:forEach>
	</table>
</div>
<div class="TableDetalles" id="divDetalle">
</div>
</body>

<script type="text/javascript" src='<c:url value="/resources/js/jquery.js" />'></script>
<script type="text/javascript">
function evento(id){

	var url="producto/"+id;
//HAcemos una llamada ajax usando el metodo get
//Le pasamos la url y la funcion que se ejecuta cuando nos 
//devuelve la informacion
	$.get(url,function(res){

		var resultado="<ul>";
		resultado+="<table><tr><th>Detalle de Producto</th><th>"+res.idProducto+"</th></tr>";
		resultado+="<tr><td>Nombre:</td><td>"+res.nombre+"</td></tr>";
		resultado+="<tr><td>Descripción:</td><td>"+res.descripcion+"</td></tr>";
		resultado+="<tr><td>Categoría:</td><td>"+res.tiendaCategoria.nombre+"</td></tr>";
		resultado+="<tr><td>Existencias:</td><td>"+res.existencias+ " unidades" + "</td></tr></table>";
		//$("#divDetalle") es el objeto, y le aplico el método html con el resultado
		$("#divDetalle").html(resultado);
		});
}
</script>	
</html>
