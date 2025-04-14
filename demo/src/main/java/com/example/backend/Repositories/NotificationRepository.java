package com.example.backend.Repositories;

import com.example.backend.Entities.Notification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, Long> {
    
    // Find notifications by user id, ordered by creation date (newest first)
    List<Notification> findByUserIdOrderByCreationDateDesc(Long userId);
    
    // Find unread notifications by user id, ordered by creation date (newest first)
    List<Notification> findByUserIdAndIsReadFalseOrderByCreationDateDesc(Long userId);
    
    // Count unread notifications for a user
    long countByUserIdAndIsReadFalse(Long userId);
    
    // Find notifications by type for a user
    List<Notification> findByUserIdAndTypeOrderByCreationDateDesc(Long userId, String type);
}