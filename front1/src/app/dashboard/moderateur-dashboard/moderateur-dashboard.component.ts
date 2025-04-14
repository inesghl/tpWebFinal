// src/app/dashboard/moderateur-dashboard/moderateur-dashboard.component.ts

import { Component } from '@angular/core';
import { AuthService } from '../../auth/services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-moderateur-dashboard',
  templateUrl: './moderateur-dashboard.component.html'
})
export class ModerateurDashboardComponent {
  userName: string = '';
  
  constructor(
    private authService: AuthService,
    private router: Router
  ) {
    const user = this.authService.getCurrentUser();
    if (user) {
      this.userName = user.email;
    }
  }

  logout(): void {
    this.authService.logout();
    this.router.navigate(['/login']);
  }
}