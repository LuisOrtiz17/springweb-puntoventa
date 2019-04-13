package com.softtek.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import com.softtek.mapper.ProveedorMapper;
import com.softtek.pojo.Proveedor;

@Component
public class ProveedorDaoImpl implements ProveedorDao {
	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Override
	public boolean save(Proveedor proveedor) throws DuplicateKeyException {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("idproveedor", proveedor.getIdproveedor());
		paramMap.put("descripcion", proveedor.getDescripcion());

		int resultado = this.jdbcTemplate.update(
				"insert into proveedor(idproveedor, descripcion) values (:idproveedor, :descripcion)", paramMap);

		return resultado == 1;
	}

	@Override
	public List<Proveedor> findAll() {
		return this.jdbcTemplate.query(
				"select * from proveedor;",
				new ProveedorMapper());
	}

	@Override
	public boolean update(Proveedor proveedor) {
		return this.jdbcTemplate.update(
				"update proveedor set descripcion=:descripcion where idproveedor=:idproveedor;",
				new BeanPropertySqlParameterSource(proveedor)) == 1;
	}

	@Override
	public boolean delete(int idproveedor) {
		return this.jdbcTemplate.update("delete from proveedor where idproveedor=:idproveedor",
				new MapSqlParameterSource("idproveedor", idproveedor)) == 1;
	}

	@Override
	public Proveedor findByIdProveedor(int idproveedor) {
		return this.jdbcTemplate.queryForObject(
				"select * from proveedor where idproveedor=:idproveedor;",
				new MapSqlParameterSource("idproveedor", idproveedor), new ProveedorMapper());
	}

}
