package com.example.backend.Controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import com.example.backend.Dto.ResearcherCreateRequest;
import com.example.backend.Dto.ResearcherUpdateRequest;
import com.example.backend.Entities.Researcher;
import com.example.backend.Services.ResearcherService;

@RestController
@RequestMapping("/api/researchers")
public class ResearcherController {

    @Autowired
    private ResearcherService researcherService;
    
    // Get all researchers (admin only)
    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping
    public ResponseEntity<List<Researcher>> getAllResearchers() {
        List<Researcher> researchers = researcherService.getAllResearchers();
        return new ResponseEntity<>(researchers, HttpStatus.OK);
    }
    
    // Get researcher by ID (admin, self, or any MODERATEUR)
    @PreAuthorize("hasAuthority('ADMIN') or #id == authentication.principal.id or hasAuthority('MODERATEUR')")
    @GetMapping("/{id}")
    public ResponseEntity<Researcher> getResearcherById(@PathVariable Long id) {
        Researcher researcher = researcherService.getResearcherById(id);
        return new ResponseEntity<>(researcher, HttpStatus.OK);
    }
    
    // Create a new researcher (admin only)
    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping
    public ResponseEntity<Researcher> createResearcher(@RequestBody ResearcherCreateRequest request) {
        Researcher newResearcher = researcherService.createResearcher(request);
        return new ResponseEntity<>(newResearcher, HttpStatus.CREATED);
    }
    
    // Update researcher (admin or self)
    @PreAuthorize("hasAuthority('ADMIN') or #id == authentication.principal.id")
    @PutMapping("/{id}")
    public ResponseEntity<Researcher> updateResearcher(
            @PathVariable Long id, 
            @RequestBody ResearcherUpdateRequest request) {
        Researcher updatedResearcher = researcherService.updateResearcher(id, request);
        return new ResponseEntity<>(updatedResearcher, HttpStatus.OK);
    }
    
    // Delete researcher (admin only)
    @PreAuthorize("hasAuthority('ADMIN')")
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteResearcher(@PathVariable Long id) {
        researcherService.deleteResearcher(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
    
    // Get current researcher's profile (if authenticated user is a researcher)
    @GetMapping("/me")
    public ResponseEntity<Researcher> getCurrentResearcher(@RequestAttribute("userId") Long userId) {
        Researcher researcher = researcherService.getResearcherById(userId);
        return new ResponseEntity<>(researcher, HttpStatus.OK);
    }
}