// package com.example.backend.Controllers;

// import com.example.backend.Dto.CreateCommentDTO;
// import com.example.backend.Dto.UpdateCommentDTO;
// import com.example.backend.Entities.Comment;
// import com.example.backend.Services.CommentService;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.http.HttpStatus;
// import org.springframework.http.ResponseEntity;
// import org.springframework.security.access.prepost.PreAuthorize;
// import org.springframework.web.bind.annotation.*;

// import java.util.List;

// @RestController
// @RequestMapping("/api/comments")
// public class CommentController {

//     @Autowired
//     private CommentService commentService;

//     // Get all comments (admin only)
//     @PreAuthorize("hasAuthority('ADMIN')")
//     @GetMapping
//     public ResponseEntity<List<Comment>> getAllComments() {
//         List<Comment> comments = commentService.getAllComments();
//         return new ResponseEntity<>(comments, HttpStatus.OK);
//     }

//     // Get comment by ID
//     @GetMapping("/{id}")
//     public ResponseEntity<Comment> getCommentById(@PathVariable Long id) {
//         Comment comment = commentService.getCommentById(id);
//         return new ResponseEntity<>(comment, HttpStatus.OK);
//     }

//     // Create a new comment
//     @PostMapping
//     public ResponseEntity<Comment> createComment(
//             @RequestBody CreateCommentDTO commentDTO,
//             @RequestAttribute("userId") Long userId) {
//         Comment createdComment = commentService.createComment(commentDTO, userId);
//         return new ResponseEntity<>(createdComment, HttpStatus.CREATED);
//     }

//     // Update comment (only for author or admin/moderator)
//     @PreAuthorize("hasAnyAuthority('ADMIN', 'MODERATEUR') or @commentService.getCommentById(#id).getAuthor().getId() == authentication.principal.id")
//     @PutMapping("/{id}")
//     public ResponseEntity<Comment> updateComment(
//             @PathVariable Long id,
//             @RequestBody UpdateCommentDTO commentDTO) {
//         Comment updatedComment = commentService.updateComment(id, commentDTO);
//         return new ResponseEntity<>(updatedComment, HttpStatus.OK);
//     }

//     // Delete comment (only for author or admin/moderator)
//     @PreAuthorize("hasAnyAuthority('ADMIN', 'MODERATEUR') or @commentService.getCommentById(#id).getAuthor().getId() == authentication.principal.id")
//     @DeleteMapping("/{id}")
//     public ResponseEntity<Void> deleteComment(@PathVariable Long id) {
//         commentService.deleteComment(id);
//         return new ResponseEntity<>(HttpStatus.NO_CONTENT);
//     }

//     // Get comments for an article
//     @GetMapping("/article/{articleId}")
//     public ResponseEntity<List<Comment>> getCommentsByArticleId(@PathVariable Long articleId) {
//         List<Comment> comments = commentService.getCommentsByArticleId(articleId);
//         return new ResponseEntity<>(comments, HttpStatus.OK);
//     }

//     // Get comments by user
//     @PreAuthorize("hasAuthority('ADMIN') or #userId == authentication.principal.id")
//     @GetMapping("/user/{userId}")
//     public ResponseEntity<List<Comment>> getCommentsByUserId(@PathVariable Long userId) {
//         List<Comment> comments = commentService.getCommentsByUserId(userId);
//         return new ResponseEntity<>(comments, HttpStatus.OK);
//     }
    
//     // Moderate a comment (mark as approved/rejected) - only for moderators and admins
//     @PreAuthorize("hasAnyAuthority('ADMIN', 'MODERATEUR')")
//     @PutMapping("/{id}/moderate")
//     public ResponseEntity<Comment> moderateComment(
//             @PathVariable Long id,
//             @RequestParam boolean approved) {
//         Comment moderatedComment = commentService.moderateComment(id, approved);
//         return new ResponseEntity<>(moderatedComment, HttpStatus.OK);
//     }
// }