package com.igmingo.tienda.repositorios;

import org.hibernate.Hibernate;

import com.igmingo.tienda.modelo.TiendaProducto;

public class RepositorioProductos extends Repositorio<TiendaProducto>{

	@Override
	public TiendaProducto get(Class<TiendaProducto> tipo, int id) {
		// TODO Auto-generated method stub
		TiendaProducto p= super.get(tipo, id);
		//hay que inicializar el hibernate en la misma sesion
		Hibernate.initialize(p.getTiendaCategoria());
		
		return p;
	}
}
