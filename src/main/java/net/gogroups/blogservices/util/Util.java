package net.gogroups.blogservices.util;

import net.gogroups.blogservices.dto.ArticleDto;
import net.gogroups.blogservices.dto.ArticleResponse;
import net.gogroups.blogservices.model.Article;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

public class Util {

    @Autowired
    private ModelMapper modelMapper;
    public String generateId(){
        UUID uuid = UUID.randomUUID();
        return uuid.toString();
    }

    public ArticleResponse paginateArticleResponse(int pageNo, int pageSize, Page<Article> articles){
        List<Article> articleList = articles.getContent();
        List<ArticleDto> articleDtos =  articleList.
                stream().map((article -> this.modelMapper.map(article,ArticleDto.class))).
                collect(Collectors.toList());
        ArticleResponse articleResponse = new ArticleResponse();
        articleResponse.setArticleDtoList(articleDtos);
        articleResponse.setPageNo(pageNo);
        articleResponse.setPageSize(pageSize);
        articleResponse.setTotalElements(articles.getTotalElements());
        articleResponse.setTotalPages(articles.getTotalPages());
        articleResponse.setLast(articles.isLast());
        return articleResponse;
    }



}
