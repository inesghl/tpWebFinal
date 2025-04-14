import { Component } from '@angular/core';
import { RouterModule } from '@angular/router'; 
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
@Component({
  selector: 'app-public-layout',
  standalone: true,  // ✅ Ensure standalone is enabled
  imports: [RouterModule,CommonModule],  //
  templateUrl: './public-layout.component.html',
//   styleUrls: ['./public-layout.component.scss']
})
export class PublicLayoutComponent {
  isLoggedIn = false;
}