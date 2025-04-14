import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
 // styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  recentPublications: any[] = [];
  latestEvents: any[] = [];
  
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
    
    this.latestEvents = [
      {
        id: 1,
        title: 'AI Research Symposium 2025',
        date: 'May 15, 2025',
        description: 'Join leading researchers discussing the future of AI.'
      },
      {
        id: 2,
        title: 'Engineering Innovation Workshop',
        date: 'April 20, 2025',
        description: 'Practical workshop on implementing novel engineering concepts.'
      }
    ];
  }

  searchPublications(term: string): void {
    // Implement search functionality
    console.log('Searching for:', term);
  }
}