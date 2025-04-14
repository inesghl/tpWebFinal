// src/app/auth/login/login.component.ts

import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../services/auth.service';
import { Role } from '../models/auth.models';
import { ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
@Component({
  selector: 'app-login',
  standalone: true, // ✅ Ensure standalone is enabled
  imports: [CommonModule, ReactiveFormsModule], // ✅ Import forms module inside component
  
  templateUrl: './login.component.html'
})
export class LoginComponent {
  loginForm: FormGroup;
  isLoading = false;
  errorMessage = '';

  constructor(
    private fb: FormBuilder,
    private authService: AuthService,
    private router: Router
  ) {
    this.loginForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required]]
    });
  }

  onSubmit(): void {
    if (this.loginForm.invalid) {
      return;
    }

    this.isLoading = true;
    this.errorMessage = '';

    this.authService.login(this.loginForm.value)
      .subscribe({
        next: (response) => {
          this.isLoading = false;
          
          // Navigate to appropriate dashboard based on role
          switch (response.role) {
            case Role.ADMIN:
              this.router.navigate(['/dashboard/admin']);
              break;
            case Role.MODERATEUR:
              this.router.navigate(['/dashboard/moderateur']);
              break;
            case Role.UTILISATEUR:
              this.router.navigate(['dashboard/admin/users']);
              break;
            default:
              this.router.navigate(['/']);
          }
        },
        error: (error) => {
          this.isLoading = false;
          this.errorMessage = error.error || 'Invalid credentials. Please try again.';
        }
      });
  }
}