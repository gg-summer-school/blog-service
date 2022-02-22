package net.gogroups.blogservices.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class User {

    @Id
    @Column(length = 50)
    private String id;
    private String name;
    
    @Email
    private String email;
    private String password;
    private boolean active;
    private boolean isApproved;
    
    @Column(columnDefinition = "LONGTEXT")
    @Size(min=3, message="Reason should have atleast 3 characters")
    private String reason;

    @JsonIgnore
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "user_role",
            joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "role_id",
                    referencedColumnName = "id"))
    private List<Role> role;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<Transaction> transactions;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    @JsonIgnore
    @JsonManagedReference
    private List<Order> orders;

    @OneToMany(mappedBy = "user", cascade =  CascadeType.ALL)
    @JsonManagedReference
    private List<Article> articles;

    public User(String id, String email, String name, String password, 
    		boolean active, boolean isApproved, String reason) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.active = active;
        this.isApproved = isApproved;
        this.reason = reason;
    }

}
