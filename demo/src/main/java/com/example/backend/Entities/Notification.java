package com.example.backend.Entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Getter
@Setter
public class Notification {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private String message;
    
    @Column(nullable = false)
    private Date creationDate;
    
    private boolean isRead;
    
    // Many Notifications belong to one User
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    @JsonBackReference
    private User user; // recipient
    
    private String type; // COMMENT, PUBLICATION, EVENT, SYSTEM
    
    private String redirectUrl; // URL to redirect when notification is clicked
}
