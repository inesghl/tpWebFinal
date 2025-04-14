// package com.example.backend.Controllers;

// import com.example.backend.Entities.Notification;
// import com.example.backend.Services.NotificationService;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.http.HttpStatus;
// import org.springframework.http.ResponseEntity;
// import org.springframework.web.bind.annotation.*;

// import java.util.List;
// import java.util.Map;

// @RestController
// @RequestMapping("/api/notifications")
// @CrossOrigin(origins = "*")
// public class NotificationController {

//     @Autowired
//     private NotificationService notificationService;

//     /**
//      * Get all notifications for a user
//      */
//     @GetMapping("/user/{userId}")
//     public ResponseEntity<List<Notification>> getUserNotifications(@PathVariable Integer userId) {
//         try {
//             List<Notification> notifications = notificationService.getUserNotifications(userId);
//             return ResponseEntity.ok(notifications);
//         } catch (RuntimeException e) {
//             return ResponseEntity.badRequest().build();
//         }
//     }

//     /**
//      * Get unread notifications for a user
//      */
//     @GetMapping("/user/{userId}/unread")
//     public ResponseEntity<List<Notification>> getUserUnreadNotifications(@PathVariable Integer userId) {
//         try {
//             List<Notification> notifications = notificationService.getUserUnreadNotifications(userId);
//             return ResponseEntity.ok(notifications);
//         } catch (RuntimeException e) {
//             return ResponseEntity.badRequest().build();
//         }
//     }

//     /**
//      * Mark a notification as read
//      */
//     @PutMapping("/{notificationId}/read")
//     public ResponseEntity<?> markAsRead(
//             @PathVariable Long notificationId,
//             @RequestParam Integer userId) {
//         try {
//             Notification notification = notificationService.markAsRead(notificationId, userId);
//             return ResponseEntity.ok(notification);
//         } catch (RuntimeException e) {
//             return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
//         }
//     }

//     /**
//      * Mark all notifications as read for a user
//      */
//     @PutMapping("/user/{userId}/read-all")
//     public ResponseEntity<?> markAllAsRead(@PathVariable Integer userId) {
//         try {
//             notificationService.markAllAsRead(userId);
//             return ResponseEntity.ok().build();
//         } catch (RuntimeException e) {
//             return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
//         }
//     }

//     /**
//      * Delete a notification
//      */
//     @DeleteMapping("/{notificationId}")
//     public ResponseEntity<?> deleteNotification(
//             @PathVariable Long notificationId,
//             @RequestParam Integer userId) {
//         try {
//             notificationService.deleteNotification(notificationId, userId);
//             return ResponseEntity.noContent().build();
//         } catch (RuntimeException e) {
//             return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
//         }
//     }

//     /**
//      * Create a custom notification (admin only)
//      */
//     @PostMapping("/create")
//     public ResponseEntity<?> createNotification(@RequestBody Map<String, Object> request) {
//         try {
//             Integer recipientUserId = (Integer) request.get("recipientUserId");
//             String message = (String) request.get("message");
//             String type = (String) request.get("type");
//             String redirectUrl = (String) request.get("redirectUrl");
            
//             Notification notification = notificationService.createNotification(
//                     recipientUserId, message, type, redirectUrl);
            
//             return ResponseEntity.status(HttpStatus.CREATED).body(notification);
//         } catch (Exception e) {
//             return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
//         }
//     }

//     /**
//      * Create a comment notification
//      */
//     @PostMapping("/comment")
//     public ResponseEntity<?> createCommentNotification(@RequestBody Map<String, Object> request) {
//         try {
//             Integer recipientUserId = (Integer) request.get("recipientUserId");
//             Integer commenterUserId = (Integer) request.get("commenterUserId");
//             Long articleId = Long.valueOf(request.get("articleId").toString());
//             String articleTitle = (String) request.get("articleTitle");
            
//             Notification notification = notificationService.createCommentNotification(
//                     recipientUserId, commenterUserId, articleId, articleTitle);
            
//             return ResponseEntity.status(HttpStatus.CREATED).body(notification);
//         } catch (Exception e) {
//             return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
//         }
//     }

//     /**
//      * Create a new publication notification
//      */
//     @PostMapping("/publication")
//     public ResponseEntity<?> createPublicationNotification(@RequestBody Map<String, Object> request) {
//         try {
//             Integer recipientUserId = (Integer) request.get("recipientUserId");
//             Integer authorUserId = (Integer) request.get("authorUserId");
//             Long articleId = Long.valueOf(request.get("articleId").toString());
//             String articleTitle = (String) request.get("articleTitle");
            
//             Notification notification = notificationService.createNewPublicationNotification(
//                     recipientUserId, authorUserId, articleId, articleTitle);
            
//             return ResponseEntity.status(HttpStatus.CREATED).body(notification);
//         } catch (Exception e) {
//             return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
//         }
//     }

//     /**
//      * Create an event notification
//      */
//     @PostMapping("/event")
//     public ResponseEntity<?> createEventNotification(@RequestBody Map<String, Object> request) {
//         try {
//             Integer recipientUserId = (Integer) request.get("recipientUserId");
//             Long eventId = Long.valueOf(request.get("eventId").toString());
//             String eventTitle = (String) request.get("eventTitle");
            
//             Notification notification = notificationService.createEventNotification(
//                     recipientUserId, eventId, eventTitle);
            
//             return ResponseEntity.status(HttpStatus.CREATED).body(notification);
//         } catch (Exception e) {
//             return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
//         }
//     }
// }
