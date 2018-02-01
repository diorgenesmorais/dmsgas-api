package com.dms.dmsgasapi.resource;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dms.dmsgasapi.model.Categoria;
import com.dms.dmsgasapi.repository.CategoriaRepository;
import com.dms.event.ResourceCreatedEvent;

@RestController
@RequestMapping("/categorias")
public class CategoriaResource {

	@Autowired
	private CategoriaRepository categoriaRepository;

	@Autowired
	private ApplicationEventPublisher publisher;

	@GetMapping
	public List<Categoria> listar() {
		return this.categoriaRepository.findAll();
	}

	@PostMapping
	public ResponseEntity<Categoria> criar(@RequestBody Categoria categoria, HttpServletResponse response) {
		Categoria categoriaSave = this.categoriaRepository.save(categoria);
		publisher.publishEvent(new ResourceCreatedEvent(this, response, categoriaSave.getId()));
		return ResponseEntity.status(HttpStatus.CREATED).body(categoriaSave);
	}

	@GetMapping("/{id}")
	public ResponseEntity<Categoria> buscarPorId(@PathVariable Long id) {
		Categoria categoria = this.categoriaRepository.findOne(id);
		if(categoria == null) {
			throw new EmptyResultDataAccessException("Está categoria não existe", 1);
		}
		return ResponseEntity.ok(categoria);
	}
}
