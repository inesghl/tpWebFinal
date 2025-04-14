// package com.example.backend.Entities;

// import com.example.backend.Enum.Role;
// import com.fasterxml.jackson.annotation.JsonManagedReference;

// import jakarta.persistence.*;
// import lombok.Getter;
// import lombok.Setter;

// import java.util.Date;
// import java.util.List;

// @Entity
// @Getter
// @Setter
// public class User {
//     @Id
//     @GeneratedValue(strategy = GenerationType.IDENTITY)
//     private Long id;

//     private String firstName;
//     private String lastName;
//     private String email;
//     private String password;
//     private Date employmentDate;
//     private String originalEstablishment;
//     private String lastDiploma;
//     private String grade;

//     @Enumerated(EnumType.STRING)
//     private Role role;

  
// @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
// @JsonManagedReference
// private List<Contribution> contributions;

// // Add these to User entity
// @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
// @JsonManagedReference
// private List<Comment> comments;

// // @OneToMany(mappedBy = "publishedBy", cascade = CascadeType.ALL)
// // @JsonManagedReference
// // private List<Announcement> announcements;

// @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
// @JsonManagedReference
// private List<Notification> notifications;

// @OneToMany(mappedBy = "uploadedBy", cascade = CascadeType.ALL)
// @JsonManagedReference
// private List<File> uploadedFiles;

// @OneToMany(mappedBy = "createdBy", cascade = CascadeType.ALL)
// @JsonManagedReference
// private List<Event> createdEvents;

// @ManyToMany(mappedBy = "participants")
// private List<Event> participatingEvents;
// }

package com.example.backend.Entities;

import com.example.backend.Enum.Role;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

@Entity
// @Inheritance(strategy = InheritanceType.JOINED)
@Getter
@Setter

public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String firstName;
    private String lastName;
    private String email;
    private String password;

    @Enumerated(EnumType.STRING)
    private Role role;

    // One User can have many Contributions
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<Contribution> contributions;

    // One User can have many Comments
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<Comment> comments;

    // One User can have many Notifications
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<Notification> notifications;

     @OneToMany(mappedBy = "createdBy", cascade = CascadeType.ALL)
    @JsonManagedReference("user-events")  //
    private List<Event> createdEvents;

    // Many-to-many relationship with Event
    @ManyToMany(mappedBy = "participants")
    @JsonIgnore  // 
    private List<Event> participatingEvents;
}
