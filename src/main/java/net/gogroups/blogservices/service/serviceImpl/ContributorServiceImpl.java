package net.gogroups.blogservices.service.serviceImpl;

import net.gogroups.blogservices.model.Contributor;
import net.gogroups.blogservices.repository.ArticleRepository;
import net.gogroups.blogservices.repository.ContributorRepository;
import net.gogroups.blogservices.service.ContributorService;
import net.gogroups.blogservices.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContributorServiceImpl implements ContributorService {
    @Autowired
    ContributorRepository contributorRepository;
    @Autowired
    ArticleRepository articleRepository;
    private Util util = new Util();

    @Override
    public void addContributors(List<Contributor> contributors, String articleId) {
        contributors.stream().forEach(contributor -> {
            Contributor contributor1 = new Contributor();
            contributor1.setId(util.generateId());
            contributor1.setName(contributor.getName());
            Contributor createdContributor = contributorRepository.saveAndFlush(contributor1);
            contributorRepository.insertArticleContributor( articleId, createdContributor.getId());
        });
    }

    @Override
    public List<Contributor> getAllContributors(String articleId) {

        return null;
    }
}
