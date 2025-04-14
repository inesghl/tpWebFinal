import { Component } from '@angular/core';
import { RouterModule } from '@angular/router'; 
import { CommonModule } from '@angular/common';
@Component({
  selector: 'app-admin-layout',
  standalone: true,  // ✅ Ensure standalone is enabled
  imports: [RouterModule,CommonModule], 
  //
  templateUrl: './admin-layout.component.html',
  //styleUrls: ['./admin-layout.component.scss']
})
export class AdminLayoutComponent {
  sidebarItems = [
    {
      title: 'Dashboard',
      icon: 'cil-speedometer',
      route: '/admin/dashboard'
    },
    {
      title: 'Researchers',
      icon: 'cil-people',
      route: '/admin/researchers'
    },
    {
      title: 'Users',
      icon: 'cil-user',
      route: '/admin/users'
    },
    {
      title: 'Publications',
      icon: 'cil-book',
      route: '/admin/publications'
    },
    {
      title: 'Research Domains',
      icon: 'cil-applications',
      route: '/admin/domains'
    },
    {
      title: 'Content Moderation',
      icon: 'cil-check',
      route: '/admin/moderation'
    },
    {
      title: 'Homepage Management',
      icon: 'cil-home',
      route: '/admin/homepage'
    }
  ];

  constructor() { }
}