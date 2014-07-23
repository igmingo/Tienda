<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detalle del producto</title>
</head>
<body>
	<table><tr><th>Detalle de Producto</th></tr>
		<tr>
			<td>Nombre</td>
			<td>${producto.nombre}</td>
		</tr>
				<tr>
			<td>Precio</td>
			<td>${producto.precio}</td>
		</tr>
		<tr>
			<td>Descripción</td>
			<td>${producto.descripcion}</td>
		</tr>
		<tr>
			<td>Categoría</td>
			<td>${producto.tiendaCategoria.nombre}</td>
		</tr>
		<tr>
			<td>Existencias</td>
			<td>${producto.existencias}</td>
		</tr>
	</table>
</body>
</html>