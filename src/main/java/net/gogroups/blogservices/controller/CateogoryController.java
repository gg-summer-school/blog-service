package net.gogroups.blogservices.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import net.gogroups.blogservices.dto.ArticleDto;
import net.gogroups.blogservices.dto.CategoryDTO;
import net.gogroups.blogservices.model.Category;
import net.gogroups.blogservices.service.CategoryService;

@RequestMapping("/api/")
@RestController
@RequiredArgsConstructor
public class CateogoryController {
	
	private final CategoryService categoryService;
	
	
	@GetMapping("public/categories")
	public List<Category> getAllCategories() {
		List<Category> allCategories = categoryService.getAllCategories();
        return allCategories;
        
	}
	
	@GetMapping("/public/categories/{categoryId}")
	public Category getACategory(@PathVariable String categoryId) {
		return categoryService.getOneCategory(categoryId);
	}
	

	
}
