package net.gogroups.blogservices.repository;

import java.util.Optional;

import net.gogroups.blogservices.model.RefreshToken;
import org.springframework.data.jpa.repository.JpaRepository;

import net.gogroups.blogservices.model.User;

public interface RefreshTokenRepository extends JpaRepository<RefreshToken, Long> {

    @Override
    Optional<RefreshToken> findById(Long id);

    Optional<RefreshToken> findByToken(String token);

    int deleteByUser(User user);

}