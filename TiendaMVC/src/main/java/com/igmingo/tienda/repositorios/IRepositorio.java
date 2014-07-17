package com.igmingo.tienda.repositorios;

import java.util.List;
import java.util.Map;

public interface IRepositorio<T> {
    public List<T> get(Class<T> tipo);
    public T get(Class<T> tipo,int id);
    public void add(T objeto);
    public void delete(T objeto);
    public void update(T objeto);
    public List<T> find(String consulta, Map<String, Object> params);
}