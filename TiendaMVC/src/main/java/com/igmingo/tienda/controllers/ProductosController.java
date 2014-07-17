package com.igmingo.tienda.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.igmingo.tienda.modelo.TiendaProducto;
import com.igmingo.tienda.repositorios.RepositorioProductos;

@Controller
public class ProductosController {
	
	@Autowired
	RepositorioProductos dao;
	
	@RequestMapping(value="/lista.html", method=RequestMethod.GET)
	public String listado(Model modelo) {
		// Una lista con la lista de productos
		List<TiendaProducto> l=dao.get(TiendaProducto.class);
		// Modelo guarda los datos para pasarle los datos a la vista
		modelo.addAttribute("productos", l);
		//devuelte listado, que gracias a Spring llama a la vista listadoproductos.jsp
		return "listadoproductos";
	}
	
	// Es recomendable por el SEO, poner una URL seo
	@RequestMapping(value="detalle-{id}.html")
	public String detalle(Model modelo,@PathVariable int id){
		TiendaProducto p=dao.get(TiendaProducto.class, id);
		modelo.addAttribute("producto", p);
		return "detalleproducto";
	}	
	
//	@RequestMapping(value="detalle.html",method=RequestMethod.GET)
//	public String detalle(Model modelo,HttpServletRequest request){
//		int id=Integer.parseInt(request.getParameter("id"));
//		TiendaProducto p=dao.get(TiendaProducto.class, id);
//		modelo.addAttribute("producto", p);
//		return "detalleproducto";
//	}

}
