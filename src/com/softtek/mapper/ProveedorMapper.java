package com.softtek.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.softtek.pojo.Proveedor;

public class ProveedorMapper implements RowMapper<Proveedor>{

	@Override
	public Proveedor mapRow(ResultSet rs, int rowNum) throws SQLException {
		Proveedor proveedor = new Proveedor();
		proveedor.setIdproveedor(rs.getInt("idproveedor"));
		proveedor.setDescripcion(rs.getString("descripcion"));
		return proveedor;
	}

}
