package net.gogroups.blogservices.repository;

import net.gogroups.blogservices.model.Article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ArticleRepository  extends JpaRepository<Article, String> {
}
