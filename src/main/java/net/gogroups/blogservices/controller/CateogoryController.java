package net.gogroups.blogservices.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import net.gogroups.blogservices.model.Category;
import net.gogroups.blogservices.service.CategoryService;

@RequestMapping("/api")
@RestController
@RequiredArgsConstructor
public class CateogoryController {
	
	private final CategoryService categoryService;
	
	@GetMapping("/public/categories")
	public List<Category> getAllCategories() {
		return categoryService.getAllCategories();
	}
	
	@GetMapping("/public/categories/{categoryId}")
	public Category getACategory(@PathVariable String categoryId) {
		return categoryService.getOneCategory(categoryId);
	}
	
	

	
}
