package com.example.backend.Controllers;

import com.example.backend.Dto.CreateArticleDTO;
import com.example.backend.Dto.UpdateArticleDTO;
import com.example.backend.Entities.Article;
import com.example.backend.Entities.Comment;
import com.example.backend.Entities.Contribution;
import com.example.backend.Services.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.http.HttpHeaders;

import org.springframework.core.io.Resource;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/articles")
@CrossOrigin(origins = "*")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    /**
     * Create a new article
     */
    @PostMapping
    public ResponseEntity<Article> createArticle(
        @RequestBody Article article,
        @RequestParam Long userId) {
    
        Article createdArticle = articleService.createArticle(article, userId);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdArticle);
    }

    /**
     * Get all articles
     */
    @GetMapping
    public ResponseEntity<List<Article>> getAllArticles() {
        List<Article> articles = articleService.getAllArticles();
        return new ResponseEntity<>(articles, HttpStatus.OK);
    }
    
    /**
     * Get articles by status (admin/moderator only)
     */
   // @PreAuthorize("hasAnyAuthority('ADMIN', 'MODERATEUR')")
    @GetMapping("/status/{status}")
    public ResponseEntity<List<Article>> getArticlesByStatus(@PathVariable String status) {
        List<Article> articles = articleService.getArticlesByStatus(status);
        return new ResponseEntity<>(articles, HttpStatus.OK);
    }

    /**
     * Get article by ID
     */
    @GetMapping("/{id}")
    public ResponseEntity<Article> getArticleById(@PathVariable Long id) {
        Article article = articleService.getArticleById(id);
        return new ResponseEntity<>(article, HttpStatus.OK);
    }

    /**
     * Update an article
     */
    @PutMapping("/{id}")
    public ResponseEntity<Article> updateArticle(
            @PathVariable Long id,
            @RequestBody Article article,
            @RequestParam Long userId) {
        Article updatedArticle = articleService.updateArticle(id, article, userId);
        return new ResponseEntity<>(updatedArticle, HttpStatus.OK);
    }
    
    /**
     * Validate an article (Admin only)
     */
  //  @PreAuthorize("hasAuthority('ADMIN')")
    @PutMapping("/{id}/validate")
    public ResponseEntity<?> validateArticle(
            @PathVariable Long id,
            @RequestBody Map<String, String> request,
            @RequestParam Long adminId) {
        try {
            String status = request.get("status");
            if (status == null || (!status.equals("APPROVED") && !status.equals("REJECTED"))) {
                return ResponseEntity.badRequest().body("Invalid status. Must be APPROVED or REJECTED");
            }
            Article validatedArticle = articleService.validateArticle(id, status, adminId);
            return ResponseEntity.ok(validatedArticle);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    /**
     * Delete an article
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteArticle(
            @PathVariable Long id,
            @RequestParam Long userId) {
        articleService.deleteArticle(id, userId);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    /**
     * Search articles by keyword
     */
    @GetMapping("/search")
    public ResponseEntity<List<Article>> searchArticles(@RequestParam String keyword) {
        List<Article> articles = articleService.searchByKeyword(keyword);
        return new ResponseEntity<>(articles, HttpStatus.OK);
    }

    /**
     * Get articles by domain
     */
    @GetMapping("/domain/{domainId}")
    public ResponseEntity<List<Article>> getArticlesByDomain(@PathVariable Long domainId) {
        List<Article> articles = articleService.getArticlesByDomain(domainId);
        return new ResponseEntity<>(articles, HttpStatus.OK);
    }

    /**
     * Assign article to user
     */
    @PostMapping("/{articleId}/assign-user/{userId}")
    public ResponseEntity<Article> assignArticleToUser(
            @PathVariable Long articleId,
            @PathVariable Long userId) {
        Article assignedArticle = articleService.assignAuthorToArticle(articleId, userId);
        return new ResponseEntity<>(assignedArticle, HttpStatus.OK);
    }

    /**
     * Assign article to domain
     */
    @PostMapping("/{articleId}/assign-domain/{domainId}")
    public ResponseEntity<Article> assignArticleToDomain(
            @PathVariable Long articleId,
            @PathVariable Long domainId,
            @RequestParam Long userId) {
        Article assignedArticle = articleService.assignDomainToArticle(articleId, domainId, userId);
        return new ResponseEntity<>(assignedArticle, HttpStatus.OK);
    }
    
    /**
     * Add a contributor to an article
     */
   // @PreAuthorize("hasAnyAuthority('ADMIN', 'MODERATEUR')")
    @PostMapping("/{articleId}/contributions")
    public ResponseEntity<Contribution> addContribution(
            @PathVariable Long articleId,
            @RequestBody Map<String, Object> request,
            @RequestParam Long userId) {
        try {
            Long contributorId = Long.parseLong(request.get("contributorId").toString());
            String type = request.get("type").toString();
            
            Contribution contribution = articleService.addContribution(articleId, userId, contributorId, type);
            return new ResponseEntity<>(contribution, HttpStatus.CREATED);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
    }

    /**
     * Add a comment to an article
     */
    @PostMapping("/{articleId}/comments")
    public ResponseEntity<Comment> addComment(
            @PathVariable Long articleId,
            @RequestBody Comment comment,
            @RequestParam Long userId) {
        Comment createdComment = articleService.addComment(articleId, comment, userId);
        return new ResponseEntity<>(createdComment, HttpStatus.CREATED);
    }

    /**
     * Get comments for an article
     */
    @GetMapping("/{articleId}/comments")
    public ResponseEntity<List<Comment>> getCommentsForArticle(@PathVariable Long articleId) {
        List<Comment> comments = articleService.getCommentsForArticle(articleId);
        return new ResponseEntity<>(comments, HttpStatus.OK);
    }

    /**
     * Moderate a comment (approve/reject) - Admin/Moderator only
     */
    @PutMapping("/comments/{commentId}/moderate")
    public ResponseEntity<?> moderateComment(
            @PathVariable Long commentId,
            @RequestBody Map<String, String> request,
            @RequestParam Long userId) {
        try {
            String status = request.get("status");
            if (status == null || (!status.equals("APPROVED") && !status.equals("REJECTED"))) {
                return ResponseEntity.badRequest().body("Invalid status. Must be APPROVED or REJECTED");
            }
            Comment moderatedComment = articleService.moderateComment(commentId, status, userId);
            return ResponseEntity.ok(moderatedComment);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }


  
    }



    @PostMapping("/{articleId}/upload")
    public ResponseEntity<Article> uploadArticleFile(
            @PathVariable Long articleId,
            @RequestParam("file") MultipartFile file) {
        Article article = articleService.uploadFile(articleId, file);
        return new ResponseEntity<>(article, HttpStatus.OK);
    }
    @GetMapping("/{articleId}/download")
    public ResponseEntity<Resource> downloadArticleFile(@PathVariable Long articleId) {
        Resource resource = articleService.downloadFile(articleId);
    
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                .body(resource);
    }
        


//     // Upload file for article
// @PreAuthorize("hasAnyAuthority('ADMIN', 'MODERATEUR') or @articleService.getArticleById(#articleId).getAuthor().getId() == authentication.principal.id")
// @PostMapping("/{articleId}/upload")
// public ResponseEntity<Article> uploadArticleFile(
//         @PathVariable Long articleId,
//         @RequestParam("file") MultipartFile file) {
//     Article updatedArticle = articleService.uploadArticleFile(articleId, file);
//     return new ResponseEntity<>(updatedArticle, HttpStatus.OK);
// }

// // Download article file
// @GetMapping("/{articleId}/download")
// public ResponseEntity<Resource> downloadArticleFile(@PathVariable Long articleId) {
//     // Get file details from the article
//     Article article = articleService.getArticleById(articleId);
//     Resource fileResource = articleService.loadArticleFileAsResource(article);
    
//     return ResponseEntity.ok()
//             .contentType(MediaType.parseMediaType("application/octet-stream"))
//             .header(HttpHeaders.CONTENT_DISPOSITION, 
//                     "attachment; filename=\"" + article.getFileName() + "\"")
//             .body(fileResource);
// }
}
















//enhaceed oneee for after  

// package com.example.backend.Controllers;

// import com.example.backend.Dto.CreateArticleDTO;
// import com.example.backend.Dto.UpdateArticleDTO;
// import com.example.backend.Entities.Article;
// import com.example.backend.Services.ArticleService;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.http.HttpStatus;
// import org.springframework.http.ResponseEntity;
// import org.springframework.security.access.prepost.PreAuthorize;
// import org.springframework.web.bind.annotation.*;
// import org.springframework.web.multipart.MultipartFile;

// import java.util.List;

// @RestController
// @RequestMapping("/api/articles")
// public class ArticleController {
//     @Autowired
//     private ArticleService articleService;

//     // Create a new article (only moderators and admins)
//     @PreAuthorize("hasAnyAuthority('ADMIN', 'MODERATEUR')")
//     @PostMapping
//     public ResponseEntity<Article> createArticle(
//             @RequestBody CreateArticleDTO articleDTO,
//             @RequestAttribute("userId") Long userId) {
//         Article createdArticle = articleService.createArticle(articleDTO, userId);
//         return new ResponseEntity<>(createdArticle, HttpStatus.CREATED);
//     }

//     // Get all articles (accessible to all authenticated users)
//     @GetMapping
//     public ResponseEntity<List<Article>> getAllArticles() {
//         List<Article> articles = articleService.getAllArticles();
//         return new ResponseEntity<>(articles, HttpStatus.OK);
//     }

//     // Get article by ID (accessible to all authenticated users)
//     @GetMapping("/{id}")
//     public ResponseEntity<Article> getArticleById(@PathVariable Long id) {
//         Article article = articleService.getArticleById(id);
//         return new ResponseEntity<>(article, HttpStatus.OK);
//     }

//     // Update article (only for author, moderator or admin)
//     @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('MODERATEUR') or @articleService.getArticleById(#id).getAuthor().getId() == authentication.principal.id")
//     @PutMapping("/{id}")
//     public ResponseEntity<Article> updateArticle(
//             @PathVariable Long id, 
//             @RequestBody UpdateArticleDTO articleDTO) {
//         Article updatedArticle = articleService.updateArticle(id, articleDTO);
//         return new ResponseEntity<>(updatedArticle, HttpStatus.OK);
//     }

//     // Delete article (only for author, moderator or admin)
//     @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('MODERATEUR') or @articleService.getArticleById(#id).getAuthor().getId() == authentication.principal.id")
//     @DeleteMapping("/{id}")
//     public ResponseEntity<Void> deleteArticle(@PathVariable Long id) {
//         articleService.deleteArticle(id);
//         return new ResponseEntity<>(HttpStatus.NO_CONTENT);
//     }

//     // Search articles by keyword (accessible to all authenticated users)
//     @GetMapping("/search")
//     public ResponseEntity<List<Article>> searchArticles(@RequestParam String keyword) {
//         List<Article> articles = articleService.searchArticlesByKeyword(keyword);
//         return new ResponseEntity<>(articles, HttpStatus.OK);
//     }

//     // Get featured/recent articles for homepage
//     @GetMapping("/featured")
//     public ResponseEntity<List<Article>> getFeaturedArticles() {
//         List<Article> articles = articleService.getFeaturedArticles();
//         return new ResponseEntity<>(articles, HttpStatus.OK);
//     }

//     // Upload file for article (PDF)
//     @PreAuthorize("hasAnyAuthority('ADMIN', 'MODERATEUR') or @articleService.getArticleById(#articleId).getAuthor().getId() == authentication.principal.id")
//     @PostMapping("/{articleId}/upload")
//     public ResponseEntity<Article> uploadArticleFile(
//             @PathVariable Long articleId,
//             @RequestParam("file") MultipartFile file) {
//         Article updatedArticle = articleService.uploadArticleFile(articleId, file);
//         return new ResponseEntity<>(updatedArticle, HttpStatus.OK);
//     }

//     // Download article file
//     @GetMapping("/{articleId}/download")
//     public ResponseEntity<?> downloadArticleFile(@PathVariable Long articleId) {
//         // Implementation will depend on your file storage approach
//         return articleService.downloadArticleFile(articleId);
//     }

//     // Assign article to user (admin only)
//     @PreAuthorize("hasAuthority('ADMIN')")
//     @PostMapping("/{articleId}/assign-user/{userId}")
//     public ResponseEntity<Article> assignArticleToUser(
//             @PathVariable Long articleId, 
//             @PathVariable Long userId) {
//         Article assignedArticle = articleService.assignArticleToUser(articleId, userId);
//         return new ResponseEntity<>(assignedArticle, HttpStatus.OK);
//     }

//     // Assign article to domain
//     @PreAuthorize("hasAnyAuthority('ADMIN', 'MODERATEUR') or @articleService.getArticleById(#articleId).getAuthor().getId() == authentication.principal.id")
//     @PostMapping("/{articleId}/assign-domain/{domainId}")
//     public ResponseEntity<Article> assignArticleToDomain(
//             @PathVariable Long articleId, 
//             @PathVariable Long domainId) {
//         Article assignedArticle = articleService.assignArticleToDomain(articleId, domainId);
//         return new ResponseEntity<>(assignedArticle, HttpStatus.OK);
//     }
    
//     // Get articles by user
//     @GetMapping("/user/{userId}")
//     public ResponseEntity<List<Article>> getArticlesByUser(@PathVariable Long userId) {
//         List<Article> articles = articleService.getArticlesByUser(userId);
//         return new ResponseEntity<>(articles, HttpStatus.OK);
//     }
    
//     // Add article to favorites
//     @PostMapping("/{articleId}/favorite")
//     public ResponseEntity<Void> addArticleToFavorites(
//             @PathVariable Long articleId,
//             @RequestAttribute("userId") Long userId) {
//         articleService.addArticleToFavorites(articleId, userId);
//         return new ResponseEntity<>(HttpStatus.OK);
//     }
    
//     // Remove article from favorites
//     @DeleteMapping("/{articleId}/unfavorite")
//     public ResponseEntity<Void> removeArticleFromFavorites(
//             @PathVariable Long articleId,
//             @RequestAttribute("userId") Long userId) {
//         articleService.removeArticleFromFavorites(articleId, userId);
//         return new ResponseEntity<>(HttpStatus.OK);
//     }
    
//     // Get user's favorite articles
//     @GetMapping("/favorites")
//     public ResponseEntity<List<Article>> getUserFavoriteArticles(
//             @RequestAttribute("userId") Long userId) {
//         List<Article> articles = articleService.getUserFavoriteArticles(userId);
//         return new ResponseEntity<>(articles, HttpStatus.OK);
//     }
// }