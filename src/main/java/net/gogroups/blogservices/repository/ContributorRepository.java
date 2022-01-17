package net.gogroups.blogservices.repository;

import net.gogroups.blogservices.model.Contributor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface ContributorRepository extends JpaRepository<Contributor, String> {

    @Transactional
    @Modifying
    @Query(value = "insert into article_contributors(article_id, contributor_id) values(:article_id, :contributor_id)",
            nativeQuery = true)
    void insertArticleContributor(@Param("article_id") String article_id, @Param("contributor_id")String contributor_id) ;



}
