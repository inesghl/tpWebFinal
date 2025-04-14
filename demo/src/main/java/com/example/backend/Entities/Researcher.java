package com.example.backend.Entities;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;
import jakarta.persistence.*;

@Entity
@Getter
@Setter
public class Researcher extends User {
    private String institution;
    private String position;
    private String department;
    private Date employmentDate;
    private String grade;
    
    // 
    // @OneToMany(mappedBy = "researcher", cascade = CascadeType.ALL)
    // @JsonManagedReference
    // private List<Article> articles;
    
    // @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    // @JsonManagedReference
    // private List<Contribution> contributions;
}