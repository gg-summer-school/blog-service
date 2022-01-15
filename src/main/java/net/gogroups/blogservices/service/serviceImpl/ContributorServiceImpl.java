package net.gogroups.blogservices.service.serviceImpl;

import net.gogroups.blogservices.exception.ResourceNotFoundException;
import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.model.Contributor;
import net.gogroups.blogservices.repository.ArticleRepository;
import net.gogroups.blogservices.repository.ContributorRepository;
import net.gogroups.blogservices.service.ContributorService;
import net.gogroups.blogservices.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ContributorServiceImpl implements ContributorService {
    @Autowired
    ContributorRepository contributorRepository;
    @Autowired
    ArticleRepository articleRepository;
    private Util util = new Util();

    @Override
    public void addContributor(String[] names, String articleId) {
        Optional<Article> article = articleRepository.findById(articleId);
        article.orElseThrow(() -> new ResourceNotFoundException("Resource not found"));
        for (String name : names) {
            Contributor contributor = new Contributor();
            contributor.setId(util.generateId());
            contributor.setName(name);
            Contributor contributor1 = contributorRepository.saveAndFlush(contributor);

        }

    }

    @Override
    public List<Contributor> getAllContributors(String articleId) {

        return null;
    }
}
