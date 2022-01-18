package net.gogroups.blogservices.service;

import java.util.List;

import net.gogroups.blogservices.model.Category;

public interface CategoryService {
		
	List<Category> getAllCategories();
	
	Category getOneCategory(String id);

}
