import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { CardModule, TableModule, BadgeModule, ButtonModule, SpinnerModule, FormModule, ModalModule } from '@coreui/angular';
import { IconModule } from '@coreui/icons-angular';
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { IconSetService } from '@coreui/icons-angular';
import { cilTrash, cilPencil, cilCheck, cilX, cilPlus, cilNotes, cilCloudDownload, cilPeople } from '@coreui/icons';
import { RouterModule } from '@angular/router';

import { PublicationService, Article, Domain, Contribution } from './publication.service';

@Component({
  selector: 'app-articles',
  imports: [
    RouterModule,
    CommonModule,
    FormsModule,
    CardModule,
    TableModule,
    BadgeModule,
    ButtonModule,
    SpinnerModule,
    IconModule,
    FormModule,
    ModalModule
  ],
  providers: [IconSetService, PublicationService],
  templateUrl: './publication.component.html',
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  styleUrls: ['./publication.component.scss']
})
export class PublicationComponent implements OnInit {
  articles: Article[] = [];
  filteredArticles: Article[] = [];
  loading: boolean = true;
  error: string | null = null;
  
  // Icons for direct access in template
  cilTrash = cilTrash;
  cilPencil = cilPencil;
  cilCheck = cilCheck;
  cilX = cilX;
  cilPlus = cilPlus;
  cilNotes = cilNotes;
  cilCloudDownload = cilCloudDownload;
  cilPeople = cilPeople;
  
  // Modal management
  showArticleModal: boolean = false;
  showDeleteModal: boolean = false;
  showContributionModal: boolean = false;
  currentArticle: Article | null = null;
  
  // New article form
  newArticle: Partial<Article> = {
    titre: '',
    doi: '',
    keyword: '',
    description: '',
    status: 'PENDING',
    domainId: null
  };
  
  // Contribution form
  newContribution: Contribution = {
    contributorId: null,
    type: 'AUTHOR' // Default type
  };
  
  // Filter options
  statusFilter: string = 'ALL';
  searchTerm: string = '';
  
  // Domains list for dropdown
  domains: Domain[] = [];
  
  // Users list for contributor assignment
  users: any[] = [];
  
  // Contribution types
  contributionTypes: string[] = ['AUTHOR', 'REVIEWER', 'EDITOR', 'CONTRIBUTOR'];
  
  // File upload
  selectedFile: File | null = null;
  
  constructor(
    private publicationService: PublicationService,
    private iconSetService: IconSetService
  ) { 
    // Register icons
    iconSetService.icons = { 
      cilTrash, cilPencil, cilCheck, cilX, cilPlus, cilNotes, cilCloudDownload, cilPeople 
    };
  }

  ngOnInit(): void {
    this.loadArticles();
    this.loadDomains();
    this.loadUsers();
  }

  loadArticles(): void {
    this.loading = true;
    this.publicationService.getAllArticles()
      .subscribe({
        next: (data) => {
          this.articles = data;
          this.applyFilters();
          this.loading = false;
        },
        error: (err) => {
          this.error = 'Failed to load articles';
          this.loading = false;
          console.error(err);
        }
      });
  }

  loadDomains(): void {
    this.publicationService.getAllDomains()
      .subscribe({
        next: (data) => {
          this.domains = data;
        },
        error: (err) => {
          console.error('Failed to load domains', err);
        }
      });
  }

  loadUsers(): void {
    this.publicationService.getAllUsers()
      .subscribe({
        next: (data) => {
          this.users = data;
        },
        error: (err) => {
          console.error('Failed to load users', err);
        }
      });
  }

  // CRUD Operations
 // In your publication.component.ts, update these methods:

// CRUD Operations
createArticle(): void {
  console.log('Creating article:', this.newArticle);
  
  // Create a clean article object
  const articleToCreate = {
    titre: this.newArticle.titre,
    doi: this.newArticle.doi,
    keyword: this.newArticle.keyword,
    description: this.newArticle.description,
    status: 'PENDING',
    domainId: this.newArticle.domainId
  };
  
  this.publicationService.createArticle(articleToCreate)
    .subscribe({
      next: (data) => {
        console.log('Article created successfully:', data);
        this.articles.push(data);
        this.applyFilters();
        this.showArticleModal = false;
        this.resetArticleForm();
        
        // Upload file if selected
        if (this.selectedFile) {
          this.uploadFile(data.id);
        }
      },
      error: (err) => {
        console.error('Failed to create article', err);
        // Display error to user
        this.error = `Failed to create article: ${err.message || 'Unknown error'}`;
        // Keep modal open so user can retry
      }
    });
}

updateArticle(): void {
  if (!this.currentArticle) return;
  
  // Create a clean article object
  const articleToUpdate = {
    id: this.currentArticle.id,
    titre: this.currentArticle.titre,
    doi: this.currentArticle.doi,
    keyword: this.currentArticle.keyword,
    description: this.currentArticle.description,
    status: this.currentArticle.status,
    domainId: this.selectedDomainId
  };
  
  this.publicationService.updateArticle(this.currentArticle.id, articleToUpdate)
    .subscribe({
      next: (data) => {
        const index = this.articles.findIndex(a => a.id === data.id);
        if (index !== -1) {
          this.articles[index] = data;
          this.applyFilters();
        }
        this.showArticleModal = false;
        
        // Upload file if selected
        if (this.selectedFile) {
          this.uploadFile(data.id);
        }
      },
      error: (err) => {
        console.error('Failed to update article', err);
        this.error = `Failed to update article: ${err.message || 'Unknown error'}`;
      }
    });
}

// Contribution management
addContribution(): void {
  if (!this.currentArticle) return;
  
  // Create a clean contribution object
  const cleanContribution = {
    contributorId: this.newContribution.contributorId,
    type: this.newContribution.type
  };
  
  this.publicationService.addContribution(this.currentArticle.id, cleanContribution)
    .subscribe({
      next: (data) => {
        // Refresh the article list to get the updated data
        this.loadArticles();
        this.showContributionModal = false;
        this.resetContributionForm();
      },
      error: (err) => {
        console.error('Failed to add contribution', err);
        this.error = `Failed to add contribution: ${err.message || 'Unknown error'}`;
      }
    });
}
  deleteArticle(id: number): void {
    this.publicationService.deleteArticle(id)
      .subscribe({
        next: () => {
          this.articles = this.articles.filter(a => a.id !== id);
          this.applyFilters();
          this.showDeleteModal = false;
        },
        error: (err) => {
          console.error('Failed to delete article', err);
        }
      });
  }
  
  validateArticle(id: number, status: string): void {
    this.publicationService.validateArticle(id, status)
      .subscribe({
        next: (data) => {
          const index = this.articles.findIndex(a => a.id === data.id);
          if (index !== -1) {
            this.articles[index] = data;
            this.applyFilters();
          }
        },
        error: (err) => {
          console.error('Failed to validate article', err);
        }
      });
  }

  
  // File handling
  onFileSelected(event: any): void {
    this.selectedFile = event.target.files[0];
  }
  
  uploadFile(articleId: number): void {
    if (!this.selectedFile) {
      console.log('No file selected, skipping upload');
      return;
    }
    
    console.log(`Uploading file for article ID ${articleId}:`, this.selectedFile.name);
    
    this.publicationService.uploadFile(articleId, this.selectedFile)
      .subscribe({
        next: (data) => {
          console.log('File uploaded successfully:', data);
          // Update the article in the list with the new file info
          const index = this.articles.findIndex(a => a.id === data.id);
          if (index !== -1) {
            this.articles[index] = data;
          }
          this.selectedFile = null;
        },
        error: (err) => {
          console.error('Failed to upload file', err);
          this.error = `Failed to upload file: ${err.message || 'Unknown error'}`;
        }
      });
  }
  
  downloadFile(articleId: number): void {
    this.publicationService.downloadFile(articleId)
      .subscribe({
        next: (data: Blob) => {
          const article = this.articles.find(a => a.id === articleId);
          if (!article || !article.filePath) {
            console.error('No file path found');
            return;
          }
          
          // Extract filename from filepath
          const fileName = article.filePath.split('/').pop() || 'download';
          
          // Create a download link and trigger the download
          const url = window.URL.createObjectURL(data);
          const a = document.createElement('a');
          a.href = url;
          a.download = fileName;
          document.body.appendChild(a);
          a.click();
          window.URL.revokeObjectURL(url);
          document.body.removeChild(a);
        },
        error: (err) => {
          console.error('Failed to download file', err);
        }
      });
  }
  
  // Domain assignment
  assignDomain(articleId: number, domainId: number): void {
    this.publicationService.assignDomain(articleId, domainId)
      .subscribe({
        next: (data) => {
          const index = this.articles.findIndex(a => a.id === data.id);
          if (index !== -1) {
            this.articles[index] = data;
            this.applyFilters();
          }
        },
        error: (err) => {
          console.error('Failed to assign domain', err);
        }
      });
  }
  
  // UI helper methods
  openCreateModal(): void {
    this.currentArticle = null;
    this.resetArticleForm();
    this.showArticleModal = true;
  }
  
  openEditModal(article: Article): void {
    this.currentArticle = { ...article };
    this.showArticleModal = true;
  }
  
  openDeleteModal(article: Article): void {
    this.currentArticle = article;
    this.showDeleteModal = true;
  }
  
  openContributionModal(article: Article): void {
    this.currentArticle = article;
    this.resetContributionForm();
    this.showContributionModal = true;
  }
  
  resetArticleForm(): void {
    this.newArticle = {
      titre: '',
      doi: '',
      keyword: '',
      description: '',
      status: 'PENDING',
      domainId: null
    };
    this.selectedFile = null;
  }
  
  resetContributionForm(): void {
    this.newContribution = {
      contributorId: null,
      type: 'AUTHOR'
    };
  }
  
  // Filtering
  applyFilters(): void {
    this.filteredArticles = this.articles.filter(article => {
      // Status filter
      if (this.statusFilter !== 'ALL' && article.status !== this.statusFilter) {
        return false;
      }
      
      // Search term filter
      if (this.searchTerm && !article.titre.toLowerCase().includes(this.searchTerm.toLowerCase())) {
        return false;
      }
      
      return true;
    });
  }
  
  getStatusBadgeColor(status: string): string {
    switch (status) {
      case 'APPROVED': return 'success';
      case 'REJECTED': return 'danger';
      case 'PENDING': return 'warning';
      default: return 'secondary';
    }
  }
  
  // Getters and setters for form binding
  get articleTitle(): string {
    return this.currentArticle ? this.currentArticle.titre : this.newArticle.titre || '';
  }

  set articleTitle(value: string) {
    if (this.currentArticle) {
      this.currentArticle.titre = value;
    } else {
      this.newArticle.titre = value;
    }
  }

  get articleDoi(): string {
    return this.currentArticle ? this.currentArticle.doi : this.newArticle.doi || '';
  }

  set articleDoi(value: string) {
    if (this.currentArticle) {
      this.currentArticle.doi = value;
    } else {
      this.newArticle.doi = value;
    }
  }

  get articleKeyword(): string {
    return this.currentArticle ? this.currentArticle.keyword : this.newArticle.keyword || '';
  }

  set articleKeyword(value: string) {
    if (this.currentArticle) {
      this.currentArticle.keyword = value;
    } else {
      this.newArticle.keyword = value;
    }
  }

  get articleDescription(): string {
    return this.currentArticle ? this.currentArticle.description : this.newArticle.description || '';
  }

  set articleDescription(value: string) {
    if (this.currentArticle) {
      this.currentArticle.description = value;
    } else {
      this.newArticle.description = value;
    }
  }
  
  get selectedDomainId(): number | null {
    if (this.currentArticle) {
      // First check if domain object exists and has an id
      if (this.currentArticle.domain && this.currentArticle.domain.id) {
        return this.currentArticle.domain.id;
      }
      // Fall back to domainId if set
      return this.currentArticle.domainId || null;
    }
    return this.newArticle.domainId || null;
  }
  
 // Make sure this is called when selecting a domain
set selectedDomainId(value: number | null) {
  console.log('Setting domain ID to:', value);
  if (this.currentArticle) {
    this.currentArticle.domainId = value;
    // Also update the domain object if it exists
    if (!this.currentArticle.domain) {
      this.currentArticle.domain = {};
    }
    this.currentArticle.domain.id = value;
  } else {
    this.newArticle.domainId = value;
  }
}

  // Helper methods for displaying names
  getContributorName(id: number): string {
    const user = this.users.find(u => u.id === id);
    return user ? `${user.firstName} ${user.lastName}` : 'Unknown User';
  }
  
  getDomainName(id: number): string {
    const domain = this.domains.find(d => d.id === id);
    return domain ? domain.name : 'Uncategorized';
  }
}