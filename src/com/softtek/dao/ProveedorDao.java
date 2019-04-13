package com.softtek.dao;

import java.util.List;

import com.softtek.pojo.Proveedor;

public interface ProveedorDao {
	public boolean save(Proveedor proveedor);
	public List<Proveedor> findAll();
	public boolean update(Proveedor proveedor);
	public boolean delete(int codigoproducto);	
	public Proveedor findByIdProveedor(int idproveedor);
}
