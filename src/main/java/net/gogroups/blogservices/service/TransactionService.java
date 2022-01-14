package net.gogroups.blogservices.service;

import java.util.List;

import net.gogroups.blogservices.model.Transaction;


public interface TransactionService {
	
	Transaction payForArticle(String user_id, String article_id, Transaction transaction);
	
	List<Transaction> getAllTransactionsOfAUser(String user_id);
}
