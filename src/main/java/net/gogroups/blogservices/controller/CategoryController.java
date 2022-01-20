package net.gogroups.blogservices.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RestController;


import lombok.RequiredArgsConstructor;
import net.gogroups.blogservices.dto.CategoryDTO;
import net.gogroups.blogservices.model.Category;
import net.gogroups.blogservices.service.CategoryService;

@RequestMapping("/api/")
@RestController
@RequiredArgsConstructor
@CrossOrigin()
public class CategoryController {
	
	private final CategoryService categoryService;
	
	 @Autowired
	    private ModelMapper modelMapper;
	
	@PreAuthorize("hasRole('READER') or hasRole('PUBLISHER') or hasRole('ADMIN')")
	@GetMapping("public/categories")
	public ResponseEntity<List<CategoryDTO>> getAllCategories() {
		List<Category> allCategories = categoryService.getAllCategories();
		List<CategoryDTO> allCategoryDto = allCategories.stream().map((allCategory -> 
		this.modelMapper.map(allCategory, CategoryDTO.class))).collect(Collectors.toList());
        return new ResponseEntity<>(allCategoryDto, HttpStatus.OK);
        
	}
	
	@PreAuthorize("hasRole('READER') or hasRole('PUBLISHER') or hasRole('ADMIN')")
	@GetMapping("/public/categories/{categoryId}")
	public ResponseEntity<CategoryDTO> getACategory(@PathVariable String categoryId) {
		Category oneCategory = categoryService.getOneCategory(categoryId);
		CategoryDTO categoryDTO = this.modelMapper.map(oneCategory, CategoryDTO.class);
		return new ResponseEntity<>(categoryDTO, HttpStatus.OK);
	}
	

	
}
