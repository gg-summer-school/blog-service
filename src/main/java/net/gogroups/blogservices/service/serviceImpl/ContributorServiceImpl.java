package net.gogroups.blogservices.service.serviceImpl;

import net.gogroups.blogservices.model.Contributor;
import net.gogroups.blogservices.repository.ArticleRepository;
import net.gogroups.blogservices.repository.ContributorRepository;
import net.gogroups.blogservices.service.ContributorService;
import net.gogroups.blogservices.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ContributorServiceImpl implements ContributorService {
    @Autowired
    ContributorRepository contributorRepository;
    @Autowired
    ArticleRepository articleRepository;
    private Util util = new Util();

    @Override
    public List<Contributor> addContributors(List<Contributor> contributors) {
        List<Contributor> contributorList = new ArrayList<>();
        contributors.stream().forEach(contributor -> {
            Contributor contributor1 = new Contributor();
            contributor1.setId(util.generateId());
            contributor1.setName(contributor.getName());
            Contributor createdContributor = contributorRepository.saveAndFlush(contributor1);
            contributorList.add(createdContributor);
            //contributorRepository.insertArticleContributor( articleId, createdContributor.getId());
        });
        return contributorList;
    }


}
