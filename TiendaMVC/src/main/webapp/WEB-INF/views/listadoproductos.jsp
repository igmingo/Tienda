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
	<input type="text" id="txtBuscar" placeholder="Pon tu búsqueda">
	<input type="button" id="btnBuscar" value="Buscar" onclick="buscar()"><span class="icon-buscar"></span>
 	<a id="btnBuscar" href="javascript:buscar()"><span class="icon-buscar"></span></a>
	
<div id="divLista" class="CSSTable">
	<table id="tblDatos">
 	<thead><tr><th>Producto</th><th>Precio</th><th>Acciones</th></tr></thead>
 	<tbody>
		<c:forEach items="${productos }" var="prod">
			<tr>
				<td>${prod.nombre }</td>
				<td>${prod.precio } €</td>			
				<td><a href="detalle-${prod.idProducto}.html"><span class="icon-ver"></span> Ver</a>
				<a href="#" id="lnkDetalle" onclick="evento(${prod.idProducto})"><span class="icon-ver"></span> Detalles </a>
				<a href="#" id="lnkBorrar" onclick="borrar(${prod.idProducto})"><span class="icon-eliminar"></span> Eliminar </a></td>
			</tr>
		</c:forEach>
	</tbody></table>
</div>
<div class="TableDetalles" id="divDetalle">
</div>
</body>

<script type="text/javascript" src='<c:url value="/resources/js/jquery.js" />'></script>

<script type="text/javascript">

function borrar(id){salario
	var datos={idProducto:id};
	var datosPasar=JSON.stringify(datos);
	$.ajax(
			"producto",{
				data:datosPasar,
				method: "DELETE",
				contentType: "application/json",
				success: function(res){
					alert("Producto borrado correctamente");
					//para actualizar el listado, hago una busqueda vacía
					$("#txtBuscar").text("");
					buscar();
					},
				error: function(res){
					alert(JSON.stringify(res));
					}
				}
			);
}


function buscar() {
	var tx=$("#txtBuscar").val();

	if(tx=="")
		tx="BusquedA_VaciA";

	var url="producto/buscar/"+tx;

	$.get(url, function (res){

		var tabla=$("#tblDatos");

		$("#tblDatos tbody tr").each(function(){
			$(this).remove();
		});
		
		//recorremos los datos devueltos con la búsqueda
		
		for(var i=0;i<res.length;i++){
			var h="";
			h+="<tr>";
			h+="<td>"+res[i].nombre+"</td>";
			h+="<td>"+res[i].precio+"</td>";
			h+="<td><a href='detalle.html?id="+res[i].idProducto+"'> Abrir Detalles </a>";
			h+="<a href='#' id='lnkDetalle' onclick='evento("+res[i].idProducto+")'> Resumen Detalles </a>";
			h+="<a href='#' id='lnkBorrar' onclick='borrar("+res[i].idProducto+")'> Borrar Producto </a></td>";
			h+="</tr>";
			tabla.append(h);
		}
		tabla.append(h);
	});
}

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
		<!-- resultado+="<tr><td>Categoría:</td><td>"+res.tiendaCategoria.nombre+"</td></tr>";
		resultado+="<tr><td>Existencias:</td><td>"+res.existencias+ " unidades" + "</td></tr></table>";
		//$("#divDetalle") es el objeto, y le aplico el método html con el resultado
		$("#divDetalle").html(resultado);
		});
}
</script>	
</html>
