// src/app/auth/models/auth.models.ts

export interface LoginRequest {
    email: string;
    password: string;
  }
  
  export interface RegisterRequest {
    email: string;
    password: string;
    firstName: string;
    lastName: string;
  }
  
  export interface LoginResponse {
    id: number;
    email: string;
    role: string;
    token: string;
  }
  
  export enum Role {
    ADMIN = 'ADMIN',
    MODERATEUR = 'MODERATEUR',
    UTILISATEUR = 'UTILISATEUR'
  }