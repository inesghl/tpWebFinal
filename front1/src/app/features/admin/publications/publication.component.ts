// users.component.ts
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { CardModule, TableModule, BadgeModule, ButtonModule, SpinnerModule, FormModule } from '@coreui/angular';
import { IconModule } from '@coreui/icons-angular';
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { IconSetService } from '@coreui/icons-angular';
import { cilTrash, cilPencil, cilCheck, cilX } from '@coreui/icons';

import { RouterModule } from '@angular/router';


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
  providers: [IconSetService],
  templateUrl: './publication.component.html',
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  styleUrls: ['./publication.component.scss']
})
export class PublicationComponent implements OnInit {
  
    recentPublications: any[] = [];
    constructor() { }

    ngOnInit(): void {
      // Mock data for demonstration
      this.recentPublications = [
        {
          id: 1,
          title: 'The Sovereign AI Genesis Project: Establishing the Foundational Principles of the Generative AI Universe',
          type: 'Preprint',
          date: 'Mar 2025',
          authors: [
            { name: 'Anweesha Banerjee', id: 1 },
            { name: 'ChatGPT (AI Language Model, OpenAI)', id: 2 }
          ]
        },
        {
          id: 2,
          title: 'The Sovereign AI Genesis Project: Empirical Validation of a Self-Generating AI Universe',
          type: 'Preprint',
          date: 'Mar 2025',
          authors: [
            { name: 'Anweesha Banerjee', id: 1 },
            { name: 'ChatGPT (AI Language Model, OpenAI)', id: 2 }
          ]
        }
      ];
      
    
    }
  
    searchPublications(term: string): void {
      // Implement search functionality
      console.log('Searching for:', term);
    }
  }