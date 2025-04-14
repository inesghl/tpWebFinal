package com.example.backend.Dto;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResearcherCreateRequest {
    // User base attributes
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    
    // Researcher-specific attributes
    private String institution;
    private String position;
    private String department;
    private Date employmentDate;
    private String grade;
}
