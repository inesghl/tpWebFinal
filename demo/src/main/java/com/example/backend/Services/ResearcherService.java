package com.example.backend.Services;

import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.backend.Enum.Role;
import com.example.backend.Entities.Researcher;
import com.example.backend.Entities.User;
import com.example.backend.Repositories.ResearcherRepository;
import com.example.backend.Dto.ResearcherUpdateRequest;
import com.example.backend.Dto.ResearcherCreateRequest;
import com.example.backend.Dto.ResearcherRegisterRequest;

@Service
public class ResearcherService {
    
    @Autowired
    private ResearcherRepository researcherRepository;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    // Method to create researcher from CreateRequest
    public Researcher createResearcher(ResearcherCreateRequest request) {
        Researcher researcher = new Researcher();
        
        // Set User attributes
        researcher.setFirstName(request.getFirstName());
        researcher.setLastName(request.getLastName());
        researcher.setEmail(request.getEmail());
        researcher.setPassword(passwordEncoder.encode(request.getPassword()));
        
        // Set Researcher-specific attributes
        researcher.setInstitution(request.getInstitution());
        researcher.setPosition(request.getPosition());
        researcher.setDepartment(request.getDepartment());
        researcher.setEmploymentDate(request.getEmploymentDate());
        researcher.setGrade(request.getGrade());
        
        // By default, set MODERATEUR role for researchers
        researcher.setRole(Role.MODERATEUR);
        
        return researcherRepository.save(researcher);
    }
    
    // Method to create researcher from RegisterRequest
    public Researcher createResearcher(ResearcherRegisterRequest request) {
        Researcher researcher = new Researcher();
        
        // Set User attributes
        researcher.setFirstName(request.getFirstName());
        researcher.setLastName(request.getLastName());
        researcher.setEmail(request.getEmail());
        researcher.setPassword(passwordEncoder.encode(request.getPassword()));
        
        // Set Researcher-specific attributes
        researcher.setInstitution(request.getInstitution());
        researcher.setPosition(request.getPosition());
        researcher.setDepartment(request.getDepartment());
        researcher.setEmploymentDate(request.getEmploymentDate());
        researcher.setGrade(request.getGrade());
        
        // By default, set MODERATEUR role for researchers
        researcher.setRole(Role.MODERATEUR);
        
        return researcherRepository.save(researcher);
    }
    
    public List<Researcher> getAllResearchers() {
        return researcherRepository.findAll();
    }
    
    public Researcher getResearcherById(Long id) {
        return researcherRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Researcher not found with id: " + id));
    }
    
    public Researcher getResearcherByEmail(String email) {
        return researcherRepository.findByEmail(email)
            .orElseThrow(() -> new RuntimeException("Researcher not found with email: " + email));
    }
    
    public Researcher updateResearcher(Long id, ResearcherUpdateRequest request) {
        Researcher existingResearcher = getResearcherById(id);
        
        // Update User attributes
        existingResearcher.setFirstName(request.getFirstName());
        existingResearcher.setLastName(request.getLastName());
        existingResearcher.setEmail(request.getEmail());
        
        // Only update password if provided
        if (request.getPassword() != null && !request.getPassword().isEmpty()) {
            existingResearcher.setPassword(passwordEncoder.encode(request.getPassword()));
        }
        
        // Update Researcher-specific attributes
        existingResearcher.setInstitution(request.getInstitution());
        existingResearcher.setPosition(request.getPosition());
        existingResearcher.setDepartment(request.getDepartment());
        existingResearcher.setEmploymentDate(request.getEmploymentDate());
        existingResearcher.setGrade(request.getGrade());
        
        return researcherRepository.save(existingResearcher);
    }
    
    public void deleteResearcher(Long id) {
        Researcher researcher = getResearcherById(id);
        researcherRepository.delete(researcher);
    }
    
    public boolean isResearcher(User user) {
        return user instanceof Researcher;
    }
}