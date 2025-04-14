package com.example.backend.Dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

public class CreateEventDTO {
    @Getter
    @Setter
    private String title;
    
    @Getter
    @Setter
    private String description;
    
    @Getter
    @Setter
    private Date startDate;
    
    @Getter
    @Setter
    private Date endDate;
    
    @Getter
    @Setter
    private String location;
    
    @Getter
    @Setter
    private String eventType;
    
    @Getter
    @Setter
    private Long organizerId;
}
