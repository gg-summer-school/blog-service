package net.gogroups.blogservices.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import net.gogroups.blogservices.model.Transaction;
import net.gogroups.blogservices.service.TransactionService;

@RequestMapping("/api/")
@RestController
@RequiredArgsConstructor
public class TransactionController {

	private final TransactionService transactionService;
	
	@PreAuthorize("hasRole('READER') or hasRole('PUBLISHER') or hasRole('ADMIN')")
	@PostMapping("protected/transaction/user/{user_id}/article/{article_id}")
	public Transaction payForArticleByUser(@PathVariable String user_id, @PathVariable String article_id, 
			@Valid @RequestBody Transaction transaction) {
		return transactionService.payForArticle(user_id, article_id, transaction);
	}
	
	@PreAuthorize("hasRole('READER') or hasRole('PUBLISHER') or hasRole('ADMIN')")
	@GetMapping("protected/transaction/user/{user_id}")
	public List<Transaction> getAllTransactionsOfUser(@PathVariable String user_id) {
		return transactionService.getAllTransactionsOfAUser(user_id);
				
	}
}
