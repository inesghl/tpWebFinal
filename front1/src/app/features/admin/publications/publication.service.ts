import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AuthService } from '../../../auth/services/auth.service';

export interface User {
  id: number;
  firstName: string;
  lastName: string;
  email?: string;
  employmentDate?: Date;
  grade?: string;
  role?: string;
  institution?: string;
  position?: string;
  department?: string;
}

export interface Article {
  id: number;
  titre: string;
  doi: string;
  keyword: string;
  description: string;
  status: string;
  domainId?: number | null;
  domain?: any;
  filePath?: string;
  contributions?: any[];
  user?: User;
}

export interface Domain {
  id: number;
  name: string;
}

export interface Contribution {
  id?: number;
  contributorId: number | null;
  type: string;
  user?: User;
}

@Injectable()
export class PublicationService {
  private apiUrl = 'http://localhost:8080/api';

  constructor(private http: HttpClient, private authService: AuthService) { }

  private getAuthHeaders(): HttpHeaders {
    const token = this.authService.getToken();
    
    if (!token) {
      console.error('Authentication token is missing!');
    }
    
    return new HttpHeaders({
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json'
    });
  }

  // Articles API methods
  getAllArticles(): Observable<Article[]> {
    return this.http.get<Article[]>(`${this.apiUrl}/articles`, { headers: this.getAuthHeaders() });
  }

  getArticleById(id: number): Observable<Article> {
    return this.http.get<Article>(`${this.apiUrl}/articles/${id}`, { headers: this.getAuthHeaders() });
  }

  createArticle(article: Partial<Article>): Observable<Article> {
    const userId = this.authService.getUserId();
    
    // Create DTO for API communication
    const articleDto = {
      titre: article.titre,
      doi: article.doi,
      keyword: article.keyword,
      description: article.description,
      status: article.status || 'PENDING',
      domainId: article.domainId
    };
    
    return this.http.post<Article>(
      `${this.apiUrl}/articles?userId=${userId}`, 
      articleDto, 
      { headers: this.getAuthHeaders() }
    );
  }

  updateArticle(id: number, article: Partial<Article>): Observable<Article> {
    const userId = this.authService.getUserId();
    
    // Create DTO for API communication
    const articleDto = {
      id: article.id,
      titre: article.titre,
      doi: article.doi,
      keyword: article.keyword,
      description: article.description,
      status: article.status,
      domainId: article.domainId
    };
    
    return this.http.put<Article>(
      `${this.apiUrl}/articles/${id}?userId=${userId}`, 
      articleDto, 
      { headers: this.getAuthHeaders() }
    );
  }

  deleteArticle(id: number): Observable<void> {
    const userId = this.authService.getUserId();
    return this.http.delete<void>(
      `${this.apiUrl}/articles/${id}?userId=${userId}`, 
      { headers: this.getAuthHeaders() }
    );
  }

  validateArticle(id: number, status: string): Observable<Article> {
    const adminId = this.authService.getUserId();
    return this.http.put<Article>(
      `${this.apiUrl}/articles/${id}/validate?adminId=${adminId}`,
      { status },
      { headers: this.getAuthHeaders() }
    );
  }

  // No changes needed for other methods...

  // Domain methods
  getAllDomains(): Observable<Domain[]> {
    return this.http.get<Domain[]>(`${this.apiUrl}/domains`, { headers: this.getAuthHeaders() });
  }

  assignDomain(articleId: number, domainId: number): Observable<Article> {
    const userId = this.authService.getUserId();
    return this.http.post<Article>(
      `${this.apiUrl}/articles/${articleId}/assign-domain/${domainId}?userId=${userId}`,
      {},
      { headers: this.getAuthHeaders() }
    );
  }

  // Contribution methods
  addContribution(articleId: number, contribution: Contribution): Observable<any> {
    const userId = this.authService.getUserId();
    
    // Clean contribution object to avoid circular references
    const cleanContribution = {
      contributorId: contribution.contributorId,
      type: contribution.type
    };
    
    return this.http.post<any>(
      `${this.apiUrl}/articles/${articleId}/contributions?userId=${userId}`,
      cleanContribution,
      { headers: this.getAuthHeaders() }
    );
  }

  // User methods
  getAllUsers(): Observable<User[]> {
    return this.http.get<User[]>(`${this.apiUrl}/users`, { headers: this.getAuthHeaders() });
  }

  // File handling methods
  uploadFile(articleId: number, file: File): Observable<Article> {
    const formData = new FormData();
    formData.append('file', file);
    
    // Create headers without content-type to let the browser set it properly for file upload
    const token = this.authService.getToken();
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}`
    });
    
    return this.http.post<Article>(
      `${this.apiUrl}/articles/${articleId}/upload`,
      formData,
      { headers: headers }
    );
  }

  downloadFile(articleId: number): Observable<Blob> {
    const headers = this.getAuthHeaders();
    return this.http.get(
      `${this.apiUrl}/articles/${articleId}/download`,
      { headers: headers, responseType: 'blob' }
    );
  }
}