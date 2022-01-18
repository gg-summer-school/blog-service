package net.gogroups.blogservices.repository;

import net.gogroups.blogservices.model.Article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleRepository  extends JpaRepository<Article, String> {

    @Query(value ="SELECT * FROM article WHERE  title LIKE CONCAT('%', :title, '%');", nativeQuery=true)
    List<Article> findByTitle(@Param("title") String title);
}
