package com.igmingo.tienda.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.igmingo.tienda.modelo.TiendaProducto;
import com.igmingo.tienda.repositorios.RepositorioProductos;

@Controller
@RequestMapping(value="/producto")
public class ProductosRESTController {

	@Autowired
	RepositorioProductos dao;
	
	@RequestMapping(value="/{id}", method=RequestMethod.GET)	
	public @ResponseBody TiendaProducto prod(@PathVariable int id){
		TiendaProducto p=dao.get(TiendaProducto.class, id);
		return p;
	}
}