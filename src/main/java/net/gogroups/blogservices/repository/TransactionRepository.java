package net.gogroups.blogservices.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.model.ERole;
import net.gogroups.blogservices.model.Transaction;
import net.gogroups.blogservices.model.User;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, String>{
	
}
