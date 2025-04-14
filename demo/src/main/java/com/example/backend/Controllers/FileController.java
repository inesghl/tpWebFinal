// package com.example.backend.Controllers;

// import com.example.backend.Dto.FileUploadResponse;
// import com.example.backend.Services.FileStorageService;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.core.io.Resource;
// import org.springframework.http.HttpHeaders;
// import org.springframework.http.HttpStatus;
// import org.springframework.http.MediaType;
// import org.springframework.http.ResponseEntity;
// import org.springframework.security.access.prepost.PreAuthorize;
// import org.springframework.web.bind.annotation.*;
// import org.springframework.web.multipart.MultipartFile;

// import java.io.IOException;

// @RestController
// @RequestMapping("/api/files")
// public class FileController {

//     @Autowired
//     private FileStorageService fileStorageService;

//     // Upload a file (associated with an article)
//     @PostMapping("/upload")
//     public ResponseEntity<FileUploadResponse> uploadFile(
//             @RequestParam("file") MultipartFile file,
//             @RequestParam(value = "articleId", required = false) Long articleId) {
//         String fileName = fileStorageService.storeFile(file, articleId);
//         FileUploadResponse response = new FileUploadResponse(
//                 fileName,
//                 file.getContentType(),
//                 file.getSize());
//         return new ResponseEntity<>(response, HttpStatus.OK);
//     }

//     // Download a file
//     @GetMapping("/download/{fileName:.+}")
//     public ResponseEntity<Resource> downloadFile(@PathVariable String fileName) {
//         Resource resource = fileStorageService.loadFileAsResource(fileName);
        
//         return ResponseEntity.ok()
//                 .contentType(MediaType.parseMediaType("application/octet-stream"))
//                 .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
//                 .body(resource);
//     }
    
//     // Get all files associated with an article
//     @GetMapping("/article/{articleId}")
//     public ResponseEntity<?> getFilesByArticleId(@PathVariable Long articleId) {
//         return new ResponseEntity<>(fileStorageService.getFilesByArticleId(articleId), HttpStatus.OK);
//     }
    
//     // Delete a file (admin or moderator only)
//     @PreAuthorize("hasAnyAuthority('ADMIN', 'MODERATEUR')")
//     @DeleteMapping("/{fileId}")
//     public ResponseEntity<?> deleteFile(@PathVariable Long fileId) {
//         fileStorageService.deleteFile(fileId);
//         return new ResponseEntity<>(HttpStatus.NO_CONTENT);
//     }
// }