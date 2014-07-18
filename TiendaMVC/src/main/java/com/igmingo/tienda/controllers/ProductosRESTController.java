package com.igmingo.tienda.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@RequestMapping(method=RequestMethod.GET, value="/{id}")	
	public @ResponseBody TiendaProducto prod(@PathVariable int id){
		TiendaProducto p=dao.get(TiendaProducto.class, id);
		return p;
	}
	

	@RequestMapping (method=RequestMethod.GET, value="/buscar/{texto}")
	public @ResponseBody List<TiendaProducto> buscar(@PathVariable String texto) {
		
		if(texto.equals("BusquedA_VaciA"))
			texto="";
		
		Map<String, Object> params=new HashMap();
		params.put("texto", "%" + texto + "%");
		List<TiendaProducto> le=dao.find("producto.buscador", params);

		return le;
	}
	@RequestMapping(method=RequestMethod.DELETE)
	public @ResponseBody String borrar(@RequestBody TiendaProducto prod){
		
		dao.delete(prod);
		
		return "borrado";
	}
}