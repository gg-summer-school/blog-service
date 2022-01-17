package net.gogroups.blogservices.service;

import net.gogroups.blogservices.model.Contributor;

import java.util.List;

public interface ContributorService {

    public void addContributors(List<Contributor>  contributors, String articleId);
    public List<Contributor> getAllContributors(String articleId);

}
