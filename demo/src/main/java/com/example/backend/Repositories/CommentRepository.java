package com.example.backend.Repositories;

import com.example.backend.Entities.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {
    
    // Find comments by article id
    List<Comment> findByArticleId(Long articleId);
    
    // Find comments by user id
    List<Comment> findByUserId(Long userId);
    
    // Find comments by status
    List<Comment> findByStatus(String status);
    
    // Find comments by article id and status
    List<Comment> findByArticleIdAndStatus(Long articleId, String status);
}
