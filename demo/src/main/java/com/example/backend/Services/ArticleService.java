package com.example.backend.Services;

import com.example.backend.Entities.Article;
import com.example.backend.Entities.Comment;
import com.example.backend.Entities.Contribution;
import com.example.backend.Entities.Domain;
import com.example.backend.Entities.User;
import com.example.backend.Enum.Role;
import com.example.backend.Repositories.ArticleRepository;
import com.example.backend.Repositories.CommentRepository;
import com.example.backend.Repositories.DomainRepository;
import com.example.backend.Repositories.UserRepository;
import com.example.backend.Repositories.ContributionRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.net.MalformedURLException;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.core.io.Resource;

import java.nio.file.Path;
import java.io.File;
import java.io.IOException;

@Service
public class ArticleService {

    @Autowired
    private ArticleRepository articleRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private DomainRepository domainRepository;

    @Autowired
    private ContributionRepository contributionRepository;

    @Autowired
    private CommentRepository commentRepository;

    /** ---------- Article CRUD ---------- */

    public List<Article> getAllArticles() {
        return articleRepository.findAll();
    }
    
    public List<Article> getArticlesByStatus(String status) {
        return articleRepository.findByStatus(status);
    }

    public Article getArticleById(Long id) {
        return articleRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Article not found with ID: " + id));
    }

    @Transactional
    public Article createArticle(Article article, Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found with ID: " + userId));

        if (article.getDomain() != null && article.getDomain().getId() != null) {
            Domain domain = domainRepository.findById(article.getDomain().getId())
                    .orElseThrow(() -> new RuntimeException("Domain not found"));
            article.setDomain(domain);
        }
        
        // Set default status
        article.setStatus("PENDING");
        
        // Set user who created the article
        article.setUser(user);
        
        Article saved = articleRepository.save(article);

        // Add author contribution
        Contribution contribution = new Contribution();
        contribution.setArticle(saved);
        contribution.setUser(user);
        contribution.setType("AUTEUR");
        contribution.setDate(new Date());
        contribution.setLieu("Non spécifié");
        contributionRepository.save(contribution);

        return saved;
    }

    @Transactional
    public Article updateArticle(Long id, Article article, Long userId) {
        User currentUser = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        
        Article existingArticle = articleRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Publication not found"));
        
        // Check if user has rights to modify (is author, admin, or moderator)
        boolean isAuthor = existingArticle.getContributions().stream()
                .anyMatch(contribution -> contribution.getUser().getId().equals(userId));
        
        if (!isAuthor && currentUser.getRole() != Role.ADMIN && currentUser.getRole() != Role.MODERATEUR) {
            throw new RuntimeException("Not authorized to update this publication");
        }
        
        // Update fields
        existingArticle.setTitre(article.getTitre());
        existingArticle.setKeyword(article.getKeyword());
        existingArticle.setDescription(article.getDescription());
        
        // Admin can update all fields
        if (currentUser.getRole() == Role.ADMIN) {
            if (article.getDoi() != null) {
                existingArticle.setDoi(article.getDoi());
            }
            
            if (article.getStatus() != null) {
                existingArticle.setStatus(article.getStatus());
            }
            
            if (article.getUser() != null && article.getUser().getId() != null) {
                User newUser = userRepository.findById(article.getUser().getId())
                        .orElseThrow(() -> new RuntimeException("User not found"));
                existingArticle.setUser(newUser);
            }
        }
        
        if (article.getDomain() != null && article.getDomain().getId() != null) {
            Domain domain = domainRepository.findById(article.getDomain().getId())
                    .orElseThrow(() -> new RuntimeException("Domain not found"));
            existingArticle.setDomain(domain);
        }
        
        return articleRepository.save(existingArticle);
    }

    @Transactional
    public void deleteArticle(Long articleId, Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        Article article = articleRepository.findById(articleId)
                .orElseThrow(() -> new RuntimeException("Article not found"));

        boolean isAuthor = article.getContributions().stream()
                .anyMatch(c -> c.getUser().getId().equals(userId));

        if (!isAuthor && user.getRole() != Role.ADMIN && user.getRole() != Role.MODERATEUR) {
            throw new RuntimeException("Unauthorized to delete this article");
        }

        articleRepository.delete(article);
    }
    
    /** ---------- Article Validation ---------- */
    
    @Transactional
    public Article validateArticle(Long articleId, String status, Long adminId) {
        User admin = userRepository.findById(adminId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        
        // Only admin can validate articles
        if (admin.getRole() != Role.ADMIN) {
            throw new RuntimeException("Only administrators can validate articles");
        }
        
        Article article = articleRepository.findById(articleId)
                .orElseThrow(() -> new RuntimeException("Article not found"));
        
        // Check if status is valid (APPROVED or REJECTED)
        if (!status.equals("APPROVED") && !status.equals("REJECTED")) {
            throw new RuntimeException("Invalid status. Must be APPROVED or REJECTED");
        }
        
        article.setStatus(status);
        return articleRepository.save(article);
    }

    /** ---------- Domain Assignment ---------- */

    @Transactional
    public Article assignDomainToArticle(Long articleId, Long domainId, Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
                
        // Check if user is admin or moderator
        if (user.getRole() != Role.ADMIN && user.getRole() != Role.MODERATEUR) {
            throw new RuntimeException("Only administrators or moderators can assign domains");
        }
        
        Article article = getArticleById(articleId);
        Domain domain = domainRepository.findById(domainId)
                .orElseThrow(() -> new RuntimeException("Domain not found"));
        article.setDomain(domain);
        return articleRepository.save(article);
    }

    /** ---------- Contribution ---------- */

    @Transactional
    public Article assignAuthorToArticle(Long articleId, Long userId) {
        Article article = getArticleById(articleId);
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // Check if this user is already a contributor
        boolean alreadyContributor = article.getContributions().stream()
                .anyMatch(c -> c.getUser().getId().equals(userId) && c.getType().equals("AUTEUR"));
                
        if (alreadyContributor) {
            throw new RuntimeException("User is already a contributor to this article");
        }

        Contribution contribution = new Contribution();
        contribution.setArticle(article);
        contribution.setUser(user);
        contribution.setType("AUTEUR");
        contribution.setDate(new Date());
        contribution.setLieu("Non spécifié");
        contributionRepository.save(contribution);

        return article;
    }
    
    @Transactional
    public Contribution addContribution(Long articleId, Long userId, Long contributorId, String type) {
        User requestingUser = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
                
        // Only admin or article owner can add contributors
        Article article = getArticleById(articleId);
        boolean isOwner = article.getUser().getId().equals(userId);
        
        if (!isOwner && requestingUser.getRole() != Role.ADMIN) {
            throw new RuntimeException("Only the article owner or administrators can add contributors");
        }
        
        User contributor = userRepository.findById(contributorId)
                .orElseThrow(() -> new RuntimeException("Contributor not found"));
                
        Contribution contribution = new Contribution();
        contribution.setArticle(article);
        contribution.setUser(contributor);
        contribution.setType(type);
        contribution.setDate(new Date());
        contribution.setLieu("Non spécifié");
        
        return contributionRepository.save(contribution);
    }

    /** ---------- Search ---------- */

    public List<Article> searchByKeyword(String keyword) {
        return articleRepository.findByKeywordContainingIgnoreCase(keyword);
    }

    public List<Article> searchByMultipleKeywords(String keyword) {
        List<String> keywords = Arrays.stream(keyword.split(","))
                .map(String::trim)
                .collect(Collectors.toList());

        return articleRepository.findAll().stream()
                .filter(article -> keywords.stream()
                        .anyMatch(k -> article.getKeyword().toLowerCase().contains(k.toLowerCase())))
                .collect(Collectors.toList());
    }

    public List<Article> getArticlesByDomain(Long domainId) {
        return articleRepository.findByDomainId(domainId);
    }

    /** ---------- Comments ---------- */

    @Transactional
    public Comment addComment(Long articleId, Comment comment, Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        Article article = getArticleById(articleId);

        comment.setUser(user);
        comment.setArticle(article);
        comment.setCreationDate(new Date());

        if (user.getRole() == Role.ADMIN || user.getRole() == Role.MODERATEUR) {
            comment.setStatus("APPROVED");
        } else {
            comment.setStatus("PENDING");
        }

        return commentRepository.save(comment);
    }

    public List<Comment> getCommentsForArticle(Long articleId) {
        return commentRepository.findByArticleId(articleId);
    }

    @Transactional
    public Comment moderateComment(Long commentId, String status, Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        if (user.getRole() != Role.ADMIN && user.getRole() != Role.MODERATEUR) {
            throw new RuntimeException("Unauthorized to moderate comments");
        }

        Comment comment = commentRepository.findById(commentId)
                .orElseThrow(() -> new RuntimeException("Comment not found"));

        comment.setStatus(status);
        return commentRepository.save(comment);
    }

public Article uploadFile(Long articleId, MultipartFile file) {
    Article article = getArticleById(articleId);

    try {
        String uploadDir = "uploads/articles/";
        String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        File dest = new File(uploadDir + fileName);

        dest.getParentFile().mkdirs(); // Crée les dossiers si nécessaire
        file.transferTo(dest);

        article.setFilePath(fileName);
        return articleRepository.save(article);
    } catch (IOException e) {
        throw new RuntimeException("Failed to upload file", e);
    }
}



public Resource downloadFile(Long articleId) {
    Article article = getArticleById(articleId);
    String uploadDir = "uploads/articles/";
    try {
        Path filePath = Paths.get(uploadDir).resolve(article.getFilePath()).normalize();
        Resource resource = new UrlResource(filePath.toUri());

        if (resource.exists()) {
            return resource;
        } else {
            throw new RuntimeException("File not found");
        }
    } catch (MalformedURLException e) {
        throw new RuntimeException("File not found", e);
    }
}

    
}