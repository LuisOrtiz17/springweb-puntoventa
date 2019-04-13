package com.softtek.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.softtek.pojo.Proveedor;
import com.softtek.service.ProveedorService;

@Controller
public class ProveedorController {
	
	@Autowired
	private ProveedorService proveedorService;
	
	@Autowired
	private MessageSource messageSource;
	
	@RequestMapping("/proveedor")
	public String showProvedor() {		
		return "proveedor";
	}
	
	@RequestMapping("/proveedor/save")
	public String saveProvedor(Model model) {
		Proveedor proveedor = new Proveedor();
		proveedor.setIdproveedor(1);
		proveedor.setDescripcion("Abarrotes Patito");

		if (proveedorService.save(proveedor)) {
			model.addAttribute("mensaje", "Datos guardados correctamente");
		} else {
			model.addAttribute("mensaje", "No se guardaron los datos");
		}

		return "proveedor";
	}
	
	@RequestMapping("/proveedor/update")
	public String updateProvedor(Model model) {
		Proveedor proveedor = new Proveedor();
		proveedor.setIdproveedor(1);
		proveedor.setDescripcion("Abarrotes Patito");

		if (proveedorService.update(proveedor)) {
			model.addAttribute("mensaje", "Dato actualizado correctamente");
		} else {
			model.addAttribute("mensaje", "No se actualizaron los datos");
		}

		return "proveedor";
	}
	
	@RequestMapping("/proveedor/delete")
	public String deleteProvedor(Model model) {
		Proveedor proveedor = new Proveedor();
		proveedor.setIdproveedor(1);
		proveedor.setDescripcion("Abarrotes Patito");

		if (proveedorService.delete(1)) {
			model.addAttribute("mensaje", "Dato eliminado correctamente");
		} else {
			model.addAttribute("mensaje", "No se eliminaron los datos");
		}

		return "proveedor";
	}
	
	@RequestMapping("/proveedor/findAll")
	public String findAllProvedor(Model model) {				
		List<Proveedor> listProveedor = proveedorService.findAll();
		model.addAttribute("listProveedor", listProveedor);
					
		if(listProveedor.isEmpty()) {
			String message = messageSource.getMessage("nodata", null, null);
			model.addAttribute("mensaje", message);
		}else {
			String message = messageSource.getMessage("buscar", null, null);
			model.addAttribute("mensaje", message);
		}
		
		return "proveedor";
	}
	
	
	@RequestMapping(value = "/proveedor/ajax/save", method = RequestMethod.POST)
	@ResponseBody
	public String saveProveedorAjax(@RequestBody Proveedor proveedor) {
		String resultado = null;

		try {
			if (proveedorService.save(proveedor)) {
				resultado = "Proveedor guardado";
			} else {
				resultado = "No se pudo guardar proveedor";
			}
		} catch (DuplicateKeyException ex) {
			resultado = "El proveedor ya existe";
		}
		
		return resultado;
	}
	
	
	@RequestMapping(value = "/proveedor/ajax/update", method = RequestMethod.POST)
	@ResponseBody
	public String updateProveedorJson(@RequestBody Proveedor proveedor) {
		String resultado = null;
		if (proveedorService.update(proveedor)) {
			resultado = "Proveedor actualizado";
		} else {
			resultado = "Proveedor no actualizado";
		}

		return resultado;
	}

	@RequestMapping(value = "/proveedor/ajax/delete", method = RequestMethod.POST)
	@ResponseBody
	public String deleteProveedorJson(@RequestBody int idproveedor) {
		String resultado = null;
		if (proveedorService.delete(idproveedor)) {
			resultado = "Proveedor eliminado";
		} else {
			resultado = "Proveedor no eliminado";
		}

		return resultado;
	}
	
	@RequestMapping(value = "/proveedor/ajax/findByIdProveedor", method = RequestMethod.POST)
	@ResponseBody
	public Proveedor findByIdProveedor(@RequestBody int idproveedor) {
		Proveedor proveedor = proveedorService.findByIdProveedor(idproveedor);
		return proveedor;
	}
}
