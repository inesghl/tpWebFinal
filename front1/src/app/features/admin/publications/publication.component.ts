import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { CardModule, TableModule, BadgeModule, ButtonModule, SpinnerModule, FormModule, ModalModule } from '@coreui/angular';
import { IconModule } from '@coreui/icons-angular';
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { IconSetService } from '@coreui/icons-angular';
import { cilTrash, cilPencil, cilCheck, cilX, cilPlus, cilNotes, cilCloudDownload, cilPeople } from '@coreui/icons';

import { RouterModule } from '@angular/router';

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
  providers: [IconSetService],
  templateUrl: './publication.component.html',
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  styleUrls: ['./publication.component.scss']
})
export class PublicationComponent implements OnInit {
  articles: any[] = [];
  filteredArticles: any[] = [];
  loading: boolean = true;
  error: string | null = null;
  
  // Modal management
  showArticleModal: boolean = false;
  showDeleteModal: boolean = false;
  showContributionModal: boolean = false;
  currentArticle: any = {};
  
  // New article form
  newArticle: any = {
    title: '',
    content: '',
    status: 'PENDING',
    domainId: null
  };
  
  // Contribution form
  newContribution: any = {
    contributorId: null,
    type: 'AUTHOR' // Default type
  };
  
  // Filter options
  statusFilter: string = 'ALL';
  searchTerm: string = '';
  
  // Domains list for dropdown
  domains: any[] = [];
  
  // Users list for contributor assignment
  users: any[] = [];
  
  // Contribution types
  contributionTypes: string[] = ['AUTHOR', 'REVIEWER', 'EDITOR', 'CONTRIBUTOR'];
  
  // File upload
  selectedFile: File | null = null;
  
  constructor(
    private http: HttpClient,
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
    this.http.get<any[]>('http://localhost:8080/api/articles')
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
    this.http.get<any[]>('http://localhost:8080/api/domains')
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
    this.http.get<any[]>('http://localhost:8080/api/users')
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
  createArticle(): void {
    const userId = localStorage.getItem('userId'); // Assuming user ID is stored in localStorage
    
    this.http.post<any>(`http://localhost:8080/api/articles?userId=${userId}`, this.newArticle)
      .subscribe({
        next: (data) => {
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
        }
      });
  }
  
  updateArticle(): void {
    const userId = localStorage.getItem('userId');
    
    this.http.put<any>(
      `http://localhost:8080/api/articles/${this.currentArticle.id}?userId=${userId}`,
      this.currentArticle
    )
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
        }
      });
  }
  
  deleteArticle(id: number): void {
    const userId = localStorage.getItem('userId');
    
    this.http.delete<void>(`http://localhost:8080/api/articles/${id}?userId=${userId}`)
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
    const adminId = localStorage.getItem('userId');
    
    this.http.put<any>(
      `http://localhost:8080/api/articles/${id}/validate?adminId=${adminId}`,
      { status }
    )
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
  
  // Contribution management
  addContribution(): void {
    const userId = localStorage.getItem('userId');
    
    this.http.post<any>(
      `http://localhost:8080/api/articles/${this.currentArticle.id}/contributions?userId=${userId}`,
      this.newContribution
    )
      .subscribe({
        next: (data) => {
          // If the API returns the updated article with contributions
          if (this.currentArticle.contributions) {
            this.currentArticle.contributions.push(data);
          } else {
            this.currentArticle.contributions = [data];
          }
          
          this.showContributionModal = false;
          this.resetContributionForm();
          
          // Refresh the article list to get the updated data
          this.loadArticles();
        },
        error: (err) => {
          console.error('Failed to add contribution', err);
        }
      });
  }
  
  // File handling
  onFileSelected(event: any): void {
    this.selectedFile = event.target.files[0];
  }
  
  uploadFile(articleId: number): void {
    if (!this.selectedFile) {
      return;
    }
    
    const formData = new FormData();
    formData.append('file', this.selectedFile);
    
    this.http.post<any>(`http://localhost:8080/api/articles/${articleId}/upload`, formData)
      .subscribe({
        next: (data) => {
          console.log('File uploaded successfully');
          // Update the article in the list with the new file info
          const index = this.articles.findIndex(a => a.id === data.id);
          if (index !== -1) {
            this.articles[index] = data;
          }
          this.selectedFile = null;
        },
        error: (err) => {
          console.error('Failed to upload file', err);
        }
      });
  }
  
  downloadFile(articleId: number): void {
    this.http.get(`http://localhost:8080/api/articles/${articleId}/download`, { 
      responseType: 'blob' 
    })
      .subscribe({
        next: (data: Blob) => {
          const article = this.articles.find(a => a.id === articleId);
          if (!article || !article.fileName) {
            console.error('No file name found');
            return;
          }
          
          // Create a download link and trigger the download
          const url = window.URL.createObjectURL(data);
          const a = document.createElement('a');
          a.href = url;
          a.download = article.fileName;
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
    const userId = localStorage.getItem('userId');
    
    this.http.post<any>(
      `http://localhost:8080/api/articles/${articleId}/assign-domain/${domainId}?userId=${userId}`,
      {}
    )
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
  
  openEditModal(article: any): void {
    this.currentArticle = { ...article };
    this.showArticleModal = true;
  }
  
  openDeleteModal(article: any): void {
    this.currentArticle = article;
    this.showDeleteModal = true;
  }
  
  openContributionModal(article: any): void {
    this.currentArticle = article;
    this.resetContributionForm();
    this.showContributionModal = true;
  }
  
  resetArticleForm(): void {
    this.newArticle = {
      title: '',
      content: '',
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
  
  getContributorName(id: number): string {
    const user = this.users.find(u => u.id === id);
    return user ? `${user.firstName} ${user.lastName}` : 'Unknown User';
  }
  
  getDomainName(id: number): string {
    const domain = this.domains.find(d => d.id === id);
    return domain ? domain.name : 'Uncategorized';
  }
}