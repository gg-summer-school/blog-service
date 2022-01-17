package net.gogroups.blogservices.config;

import lombok.Getter;
import net.gogroups.blogservices.exception.CustomIOException;
import org.springframework.context.annotation.Configuration;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Getter
@Configuration
public class AppConfig {

    private final String filesMainDirectory = "uploads";

    private final  String articlesCoverPageBaseDirectory = "coverPages";

	private final String articlesBaseDirectory = "articles";

	public void setupFilesBaseDirectories(){
		Path uploads = Paths.get(this.filesMainDirectory);
		Path coverPagePath = Paths.get(this.filesMainDirectory + "/" +this.articlesCoverPageBaseDirectory);
		Path articlesPath = Paths.get(this.filesMainDirectory + "/"+ this.articlesBaseDirectory);
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