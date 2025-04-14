// package com.example.backend.Services;

// import com.example.backend.Entities.Notification;
// import com.example.backend.Entities.User;
// import com.example.backend.Repositories.NotificationRepository;
// import com.example.backend.Repositories.UserRepository;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Service;
// import org.springframework.transaction.annotation.Transactional;

// import java.util.Date;
// import java.util.List;
// import java.util.Optional;

// @Service
// public class NotificationService {

//     @Autowired
//     private NotificationRepository notificationRepository;

//     @Autowired
//     private UserRepository userRepository;

//     /**
//      * Create a notification for a user
//      */
//     @Transactional
//     public Notification createNotification(Long userId, String message, String type, String redirectUrl) {
//         User user = userRepository.findById(userId)
//                 .orElseThrow(() -> new RuntimeException("User not found"));
        
//         Notification notification = new Notification();
//         notification.setUser(user);
//         notification.setMessage(message);
//         notification.setType(type);
//         notification.setRedirectUrl(redirectUrl);
//         notification.setCreationDate(new Date());
//         notification.setRead(false);
        
//         return notificationRepository.save(notification);
//     }

//     /**
//      * Get all notifications for a user
//      */
//     public List<Notification> getUserNotifications(Long userId) {
//         User user = userRepository.findById(userId)
//                 .orElseThrow(() -> new RuntimeException("User not found"));
        
//         return notificationRepository.findByUserIdOrderByCreationDateDesc(userId);
//     }

//     /**
//      * Get unread notifications for a user
//      */
//     public List<Notification> getUserUnreadNotifications(Long userId) {
//         User user = userRepository.findById(userId)
//                 .orElseThrow(() -> new RuntimeException("User not found"));
        
//         return notificationRepository.findByUserIdAndIsReadFalseOrderByCreationDateDesc(userId);
//     }

//     /**
//      * Mark a notification as read
//      */
//     @Transactional
//     public Notification markAsRead(Long notificationId, Long userId) {
//         Notification notification = notificationRepository.findById(notificationId)
//                 .orElseThrow(() -> new RuntimeException("Notification not found"));
        
//         // Check if notification belongs to the user
//         if (notification.getUser().getId() != userId) {
//             throw new RuntimeException("Unauthorized access to notification");
//         }
        
        
//         notification.setRead(true);
//         return notificationRepository.save(notification);
//     }

//     /**
//      * Mark all user notifications as read
//      */
//     @Transactional
//     public void markAllAsRead(Long userId) {
//         User user = userRepository.findById(userId)
//                 .orElseThrow(() -> new RuntimeException("User not found"));
        
//         List<Notification> unreadNotifications = 
//             notificationRepository.findByUserIdAndIsReadFalseOrderByCreationDateDesc(userId);
        
//         for (Notification notification : unreadNotifications) {
//             notification.setRead(true);
//             notificationRepository.save(notification);
//         }
//     }

//     /**
//      * Delete a notification
//      */
//     @Transactional
//     public void deleteNotification(Long notificationId, Integer userId) {
//         Notification notification = notificationRepository.findById(notificationId)
//                 .orElseThrow(() -> new RuntimeException("Notification not found"));
        
//         // Check if notification belongs to the user
//         if (notification.getUser().getId() != userId) {
//             throw new RuntimeException("Unauthorized access to notification");
//         }
        
        
//         notificationRepository.delete(notification);
//     }
    
//     /**
//      * Create comment notification
//      */
//     public Notification createCommentNotification(Integer recipientUserId, Integer commenterUserId, 
//                                                 Long articleId, String articleTitle) {
//         User commenter = userRepository.findById(commenterUserId)
//                 .orElseThrow(() -> new RuntimeException("Commenter user not found"));
        
//         String message = commenter.getFirstName() + " " + commenter.getLastName() + 
//                         " commented on your publication: " + articleTitle;
        
//         String redirectUrl = "/articles/" + articleId;
        
//         return createNotification(recipientUserId, message, "COMMENT", redirectUrl);
//     }
    
//     /**
//      * Create new publication notification for followers or users in same domain
//      */
//     public Notification createNewPublicationNotification(Integer recipientUserId, Integer authorUserId, 
//                                                     Long articleId, String articleTitle) {
//         User author = userRepository.findById(authorUserId)
//                 .orElseThrow(() -> new RuntimeException("Author user not found"));
        
//         String message = author.getFirstName() + " " + author.getLastName() + 
//                         " published a new article: " + articleTitle;
        
//         String redirectUrl = "/articles/" + articleId;
        
//         return createNotification(recipientUserId, message, "PUBLICATION", redirectUrl);
//     }
    
//     /**
//      * Create event notification
//      */
//     public Notification createEventNotification(Integer recipientUserId, Long eventId, String eventTitle) {
//         String message = "New event: " + eventTitle;
//         String redirectUrl = "/events/" + eventId;
        
//         return createNotification(recipientUserId, message, "EVENT", redirectUrl);
//     }
// }