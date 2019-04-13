package com.softtek.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.stereotype.Service;

import com.softtek.dao.ProveedorDao;
import com.softtek.mapper.ProveedorMapper;
import com.softtek.pojo.Proveedor;

@Service
public class ProveedorService {
	
	@Autowired
	private ProveedorDao proveedorDao;
	
	public boolean save(Proveedor proveedor) throws DuplicateKeyException {
		return proveedorDao.save(proveedor);
	}

	
	public List<Proveedor> findAll() {
		return proveedorDao.findAll();
	}

	
	public boolean update(Proveedor proveedor) {
		return proveedorDao.update(proveedor);
	}

	
	public boolean delete(int idproveedor) {
		return proveedorDao.delete(idproveedor);
	}
	
	public Proveedor findByIdProveedor(int idproveedor) {
		return proveedorDao.findByIdProveedor(idproveedor);
	}

}
