package com.example.backend.Dto;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResearcherRegisterRequest {
    // Basic registration fields from RegisterRequest
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    
    // Researcher-specific fields
    private String institution;
    private String position;
    private String department;
    private Date employmentDate;
    private String grade;
    
    public ResearcherRegisterRequest() {
    }
}