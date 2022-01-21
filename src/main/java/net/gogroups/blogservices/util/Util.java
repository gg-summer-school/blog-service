package net.gogroups.blogservices.util;

import net.gogroups.blogservices.dto.ArticleDto;
import net.gogroups.blogservices.exception.ResourceNotFoundException;
import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.model.User;
import net.gogroups.blogservices.repository.UserRepository;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

public class Util {
	
	@Autowired
	UserRepository userRepository;

    @Autowired
    private ModelMapper modelMapper = new ModelMapper();
    
    public String generateId(){
        UUID uuid = UUID.randomUUID();
        return uuid.toString();
    }

   public List<ArticleDto> convertArticlesToArticleDtos(List<Article>  articles){
       List<ArticleDto> articleDtos = articles.
               stream().map(article -> this.modelMapper.map(article,ArticleDto.class)).collect(Collectors.toList());
       return articleDtos;
   }
   
   public User checkingUserResource(String resource) {
		Optional<User> user = userRepository.findById(resource);
		if (!user.isPresent()) {
			throw new ResourceNotFoundException("User not found with id- " + resource);
		}
		return user.get();
	}



}
