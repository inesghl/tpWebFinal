// package com.example.backend.Entities;

// import jakarta.persistence.*;
// import lombok.Getter;
// import lombok.Setter;

// import java.util.Date;

// @Entity
// @Getter
// @Setter
// public class File {
//     @Id
//     @GeneratedValue(strategy = GenerationType.IDENTITY)
//     private Long id;
    
//     @Column(nullable = false)
//     private String fileName;
    
//     @Column(nullable = false)
//     private String filePath;
    
//     @Column(nullable = false)
//     private String fileType;
    
//     private Long fileSize;
    
//     @Column(nullable = false)
//     private Date uploadDate;
    
//     // One ArticleFile belongs to one Article
//     @OneToOne
//     @JoinColumn(name = "article_id", nullable = false)
//     private Article article;
// }

// File Entity
package com.example.backend.Entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Getter
@Setter
public class File {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private String fileName;
    
    @Column(nullable = false)
    private String filePath;
    
    private String fileType; // PDF, DOC, etc.
    
    private Long fileSize; // in bytes
    
    @Column(nullable = false)
    private Date uploadDate;
    
    // One File belongs to one Article
    @OneToOne
    @JoinColumn(name = "article_id", nullable = false)
    @JsonBackReference
    private Article article;
}