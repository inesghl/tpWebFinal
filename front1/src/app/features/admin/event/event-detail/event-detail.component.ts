// src/app/events/event-detail/event-detail.component.ts
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { EventService, Event } from '../../event/event.service';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { CardModule, TableModule, BadgeModule, ButtonModule, SpinnerModule, BreadcrumbModule } from '@coreui/angular';
import { IconModule } from '@coreui/icons-angular';
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { IconSetService } from '@coreui/icons-angular';

@Component({
  selector: 'app-event-detail',
  imports: [
      CommonModule,
      FormsModule,
      CardModule,
      TableModule,
      BadgeModule,
      ButtonModule,
      SpinnerModule,
      BreadcrumbModule,
      IconModule,
    ],
    providers: [IconSetService, EventService],
  templateUrl: './event-detail.component.html',
  styleUrls: ['./event-detail.component.scss'],
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  
})
export class EventDetailComponent implements OnInit {
  event?: Event;
  isLoading = true;
  events: Event[] = [];
  filteredEvents: Event[] = [];
  loading: boolean = true;
  searchTerm: string = '';
  currentFilter: string = 'all';
  selectedEvent: Event | null = null;
  deleteModal: any;
  participantsModal: any;
  constructor(
    private route: ActivatedRoute,
    private eventService: EventService
  ) {}
  formatDate(date: string | Date): string {
    if (!date) return '';
    const d = new Date(date);
    return d.toLocaleDateString('fr-FR', { day: '2-digit', month: 'short', year: 'numeric' });
  }

  formatTime(date: string | Date): string {
    if (!date) return '';
    const d = new Date(date);
    return d.toLocaleTimeString('fr-FR', { hour: '2-digit', minute: '2-digit' });
  }
  getStatusBadgeClass(status: string): string {
    const classMap: {[key: string]: string} = {
      'UPCOMING': 'bg-info',
      'ONGOING': 'bg-success',
      'COMPLETED': 'bg-secondary',
      'CANCELLED': 'bg-danger'
    };
    
    return classMap[status] || 'bg-light text-dark';
  }
  ngOnInit(): void {
    const id = Number(this.route.snapshot.paramMap.get('id'));
    if (id) {
      this.eventService.getEventById(id).subscribe({
        next: (event) => {
          this.event = event;
          this.isLoading = false;
        },
        error: (err) => {
          console.error('Error loading event:', err);
          this.isLoading = false;
        }
      });
    }
        
    const eventId = this.selectedEvent?.id;
    const eventTitle = this.selectedEvent?.title;
  }
  
}
