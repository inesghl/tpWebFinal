// users.component.ts
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { CardModule, TableModule, BadgeModule, ButtonModule, SpinnerModule, FormModule } from '@coreui/angular';
import { IconModule } from '@coreui/icons-angular';
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { UserService } from './researchers.service';
import { IconSetService } from '@coreui/icons-angular';
import { cilTrash, cilPencil, cilCheck, cilX } from '@coreui/icons';

import { RouterModule } from '@angular/router';
interface User {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  employmentDate: Date;
  originalEstablishment: string;
  lastDiploma: string;
  grade: string;
  role: string;
}

@Component({
  selector: 'app-users',
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
    FormModule
  ],
  providers: [UserService, IconSetService],
  templateUrl: './researchers-management.component.html',
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  styleUrls: ['./researchers-management.component.scss']
})
export class ResearchersComponent implements OnInit {
  users: User[] = [];
  loading = true;
  error: string | null = null;
  editingUserId: number | null = null;
  editForm: any = {};
  
  selectedUser: User | null = null;
  showUserDetails = false;

  constructor(
    private userService: UserService,
    private iconSetService: IconSetService,
    private router: Router
  ) {
    // Register the icons
    iconSetService.icons = { cilTrash, cilPencil,  cilCheck, cilX };
  }

  ngOnInit(): void {
    this.loadUsers();
  }

  loadUsers(): void {
    this.loading = true;
    this.userService.getModerateurs()
      .subscribe({
        next: (data) => {
          this.users = data;
          this.loading = false;
        },
        error: (err) => {
          this.error = 'Failed to load users. Please try again.';
          this.loading = false;
          console.error('Error loading users:', err);
        }
      });
  }

  viewUser(user: User): void {
    this.selectedUser = { ...user };
    this.showUserDetails = true;
    // Alternatively, navigate to a dedicated user details page:
    // this.router.navigate(['/dashboard/admin/users', user.id]);
  }

  isEditing(userId: number): boolean {
    return this.editingUserId === userId;
  }

  editUser(user: User): void {
    this.editingUserId = user.id;
    // Create a copy of the user object to edit
    this.editForm = { ...user };
    
    // Format the date for the date input
    if (this.editForm.employmentDate) {
      const date = new Date(this.editForm.employmentDate);
      this.editForm.employmentDate = date.toISOString().split('T')[0];
    }
  }

  cancelEdit(): void {
    this.editingUserId = null;
    this.editForm = {};
  }

  saveUser(): void {
    if (!this.editingUserId) return;
    
    this.userService.updateUser(this.editingUserId, this.editForm)
      .subscribe({
        next: (updatedUser) => {
          // Update the user in the list
          const index = this.users.findIndex(u => u.id === this.editingUserId);
          if (index !== -1) {
            this.users[index] = updatedUser;
          }
          this.editingUserId = null;
          this.editForm = {};
        },
        error: (err) => {
          console.error('Error updating user:', err);
          alert('Failed to update user. Please try again.');
        }
      });
  }

  deleteUser(id: number): void {
    if (confirm('Are you sure you want to delete this user?')) {
      this.userService.deleteUser(id)
        .subscribe({
          next: () => {
            this.users = this.users.filter(user => user.id !== id);
          },
          error: (err) => {
            console.error('Error deleting user:', err);
            alert('Failed to delete user. Please try again.');
          }
        });
    }
  }

  formatDate(date: Date): string {
    return new Date(date).toLocaleDateString();
  }
}