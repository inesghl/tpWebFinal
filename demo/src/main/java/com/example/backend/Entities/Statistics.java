package com.example.backend.Entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "statistics")
@Getter
@Setter
public class Statistics {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    // Many Statistics belong to one Article
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "article_id", referencedColumnName = "id", nullable = false)
    @JsonBackReference
    private Article article;
    
    // Many Statistics belong to one User
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @JsonBackReference
    private User user; // who viewed/downloaded (can be null for anonymous)
    
    @Column(nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date actionDate;
    
    @Column(nullable = false, length = 20)
    private String actionType; // VIEW, DOWNLOAD
}
