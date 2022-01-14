package net.gogroups.blogservices.service.serviceImpl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.gogroups.blogservices.exception.ResourceNotFoundException;
import net.gogroups.blogservices.model.Category;
import net.gogroups.blogservices.repository.CategoryRepository;
import net.gogroups.blogservices.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	private CategoryRepository repository;
	
	
	@Override
	public List<Category> getAllCategories() {
		List<Category> findAllCategories = repository.findAll();
		if(findAllCategories.isEmpty()) {
			throw new ResourceNotFoundException("Not Categories Found");
		}
		return findAllCategories;
	}

	@Override
	public Category getOneCategory(String id) {
		Optional<Category> oneCategory = repository.findById(id);
		
		if(!repository.existsById(id)) {
			throw new ResourceNotFoundException("Category not found for id- "+ id);
		}
		return oneCategory.get();
	}
	

}
