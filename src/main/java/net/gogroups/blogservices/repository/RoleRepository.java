package net.gogroups.blogservices.repository;

import net.gogroups.blogservices.model.ERole;
import net.gogroups.blogservices.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {

   Role findByRole(ERole role);
}
