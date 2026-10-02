package net.gogroups.blogservices.config;

import net.gogroups.blogservices.exception.CustomIOException;
import org.springframework.context.annotation.Configuration;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


@Configuration
public class AppConfig {

	public static final String FILEMAINDIRECTORY = "uploads";
	public static  final String ARTICLECOVERPAGEBASEDIRECTORY  = "coverPages";
	public static final String ARTICLEBASEDIRECTORY  = "articles";
	public static  final String SORTBY = "title";
	public static final String SORTDIRECTION = "asc";
	public static final String PAGENUMBER = "0";
	public static final String PAGESIZE = "20";
	


	public static  void setupFilesBaseDirectories(){
		Path uploads = Paths.get(FILEMAINDIRECTORY);
		Path coverPagePath = Paths.get(FILEMAINDIRECTORY + "/" + ARTICLECOVERPAGEBASEDIRECTORY);
		Path articlesPath = Paths.get(FILEMAINDIRECTORY + "/"+ ARTICLEBASEDIRECTORY);
		if(!Files.exists(uploads)){
			try {
				Files.createDirectory(uploads);
			} catch (IOException e) {
				throw  new CustomIOException("could not create base folder to store the files");
			}
		}
		if(!Files.exists(coverPagePath)){
			try {
				Files.createDirectory(coverPagePath);
			} catch (IOException e) {
				throw  new CustomIOException("could not create base folder to store the article pages");
			}
		}
		if(!Files.exists(articlesPath)){
			try {
				Files.createDirectory(articlesPath);
			} catch (IOException e) {
				throw  new CustomIOException("could not create base folder to store the articles");
			}
		}
	}

}
