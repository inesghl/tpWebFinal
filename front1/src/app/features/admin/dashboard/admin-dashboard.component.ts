import { Component, OnInit, AfterViewInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { Router } from '@angular/router';
import { BubbleDataPoint, Chart, ChartDataset, ChartTypeRegistry, Point, registerables } from 'chart.js';
import { RouterModule } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { StatisticsService } from './statistics.service';

import { OverallStats, DomainStat } from './statistics.model';
// Import CoreUI modules
import { 
  AvatarModule,
  BadgeModule,
  BreadcrumbModule,
  ButtonModule,
  CardModule,
  DropdownModule,
  FooterModule,
  FormModule,
  GridModule,
  HeaderModule,
  ListGroupModule,
  NavModule,
  SidebarModule,
  WidgetModule,
  UtilitiesModule,
} from '@coreui/angular';

// Import CoreUI Icons
import { IconModule, IconSetService } from '@coreui/icons-angular';

// Register Chart.js components
Chart.register(...registerables);

@Component({
  selector: 'app-admin-dashboard',
  standalone: true,
  imports: [
    RouterModule,
    CommonModule,
    HttpClientModule,
    // CoreUI Modules
    AvatarModule,
    BadgeModule,
    BreadcrumbModule,
    ButtonModule,
    CardModule,
    DropdownModule,
    FooterModule,
    FormModule,
    GridModule,
    HeaderModule,
    IconModule,
    ListGroupModule,
    NavModule,
    SidebarModule,
    WidgetModule,
    UtilitiesModule
  ],
  providers: [IconSetService, StatisticsService],
  
  templateUrl: './admin-dashboard.component.html',
  styleUrls: ['./admin-dashboard.component.scss'],
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
})
export class AdminDashboardComponent implements OnInit, AfterViewInit {
  stats = {
    totalUsers: 0,
    totalResearchers: 0,
    totalArticles: 0,
    totalDomains: 0
  };

  recentActivity = [
    { type: 'publication', action: 'added', title: 'Quantum Computing Applications in Medical Research', user: 'Dr. Smith', time: '2 hours ago' },
    { type: 'user', action: 'registered', name: 'Jane Doe', role: 'Researcher', time: '5 hours ago' },
    { type: 'publication', action: 'pending', title: 'AI Ethics in Modern Society', user: 'Prof. Johnson', time: '1 day ago' },
    { type: 'domain', action: 'added', name: 'Biomedical Engineering', time: '2 days ago' }
  ];

  private visitorChart!: Chart;
  private customerChart!: Chart;
  
  articlesByDomain: any[] = [];
  downloadsByDomain: any[] = [];
Math: any;
  
  constructor(
    private router: Router,
    private statisticsService: StatisticsService
  ) { }

  ngOnInit(): void {
    this.loadOverallStatistics();
    this.loadArticlesByDomain();
    this.loadDownloadsByDomain();
  }
  
  ngAfterViewInit(): void {
    // We'll initialize charts after data is loaded
    setTimeout(() => {
      this.initVisitorChart();
      this.initCustomerChart();
    }, 500);
  }

  loadOverallStatistics(): void {
    this.statisticsService.getOverallStatistics().subscribe(data => {
      this.stats = {
        totalUsers: data.totalUsers || 0,
        totalResearchers: data.totalResearchers || 0,
        totalArticles: data.totalArticles || 0,
        totalDomains: data.totalDomains || 0
      };
    });
  }

  loadArticlesByDomain(): void {
    this.statisticsService.getArticlesByDomain().subscribe(data => {
      this.articlesByDomain = data;
      if (this.customerChart) {
        this.updateCustomerChart();
      }
    });
  }

  loadDownloadsByDomain(): void {
    this.statisticsService.getDownloadsByDomain().subscribe(data => {
      this.downloadsByDomain = data;
      if (this.visitorChart) {
        this.updateVisitorChart();
      }
    });
  }

  toggleSidebar(): void {
    // Implement sidebar toggle logic
    const sidebar = document.querySelector('.sidebar') as HTMLElement;
    if (sidebar) {
      sidebar.classList.toggle('collapsed');
    }
  }

  private initVisitorChart(): void {
    const ctx = document.getElementById('visitorChart') as HTMLCanvasElement;
    if (ctx) {
      // Format data for the chart
      const labels = this.downloadsByDomain.map(item => item.period || item.month || '');
      const datasets = [];
      
      // Group data by domain
      const domainData: any = {};
      
      this.downloadsByDomain.forEach(item => {
        if (!domainData[item.domain]) {
          domainData[item.domain] = [];
        }
        domainData[item.domain].push(item.count);
      });
      
      // Create datasets for each domain
      const colors = ['#3399ff', '#2eb85c', '#f9b115', '#e55353', '#6f42c1'];
      let colorIndex = 0;
      
      for (const domain in domainData) {
        const color = colors[colorIndex % colors.length];
        colorIndex++;
        
        datasets.push({
          label: domain,
          data: domainData[domain],
          borderColor: color,
          backgroundColor: `${color}20`, // Add transparency
          tension: 0.4,
          fill: false
        });
      }
      
      // If no real data, use placeholder
      if (datasets.length === 0) {
        datasets.push(
          {
            label: 'Arts',
            data: [20, 45, 28, 45, 35, 55, 45, 65, 38, 45],
            borderColor: '#3399ff',
            backgroundColor: 'rgba(51, 153, 255, 0.1)',
            tension: 0.4,
            fill: false
          },
          {
            label: 'Commerce',
            data: [55, 25, 45, 35, 55, 35, 65, 45, 60, 35],
            borderColor: '#2eb85c',
            backgroundColor: 'rgba(46, 184, 92, 0.1)',
            tension: 0.4,
            fill: false
          }
        );
      }

      this.visitorChart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: labels.length > 0 ? labels : ['15 Jan', 'Feb', '15 Feb', 'Mar', '15 Mar', 'Apr', '15 Apr', 'May', '15 May', 'Jun'],
          datasets: datasets
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          plugins: {
            legend: {
              position: 'bottom'
            }
          },
          scales: {
            y: {
              beginAtZero: true,
              title: {
                display: true,
                text: 'Downloads'
              }
            },
            x: {
              title: {
                display: true,
                text: 'Period'
              }
            }
          }
        }
      });
    }
  }

  

  private initCustomerChart(): void {
    const ctx = document.getElementById('customerChart') as HTMLCanvasElement;
    if (ctx) {
      // Transform articles by domain data for chart
      const labels = this.articlesByDomain.map(item => item.domain || '');
      const data = this.articlesByDomain.map(item => item.count || 0);
      
      // Generate colors
      const backgroundColors = [
        '#3399ff', '#2eb85c', '#f9b115', '#e55353', '#6f42c1',
        '#39f', '#2c9', '#fc0', '#f66', '#609'
      ];
      
      // Use placeholder data if no real data
      const chartLabels = labels.length > 0 ? labels : ['AI', 'ML', 'SECURITY', 'WEB', 'MOBILE', 'CLOUD'];
      const chartData = data.length > 0 ? data : [674, 182, 284, 195, 221, 178];
      const chartColors = backgroundColors.slice(0, chartLabels.length);
      
      this.customerChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
          labels: chartLabels,
          datasets: [{
            data: chartData,
            backgroundColor: chartColors,
            borderWidth: 0
          }]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          cutout: '70%',
          plugins: {
            legend: { 
              display: false 
            },
            tooltip: { 
              enabled: true 
            }
          }
        }
      });
    }
  }
  
 // Only showing the updated methods
private updateCustomerChart(): void {
  if (this.customerChart && this.articlesByDomain.length > 0) {
    const labels = this.articlesByDomain.map(item => item.domain || '');
    const data = this.articlesByDomain.map(item => item.count || 0);
    
    // Generate colors
    const backgroundColors = [
      '#3399ff', '#2eb85c', '#f9b115', '#e55353', '#6f42c1',
      '#39f', '#2c9', '#fc0', '#f66', '#609'
    ];
    const chartColors = backgroundColors.slice(0, labels.length);
    
    this.customerChart.data.labels = labels;
    this.customerChart.data.datasets[0].data = data;
    this.customerChart.data.datasets[0].backgroundColor = chartColors;
    this.customerChart.update();
  }
}

private updateVisitorChart(): void {
  if (this.visitorChart && this.downloadsByDomain.length > 0) {
    // Get unique periods/months and domains
    const periods = [...new Set(this.downloadsByDomain.map(item => item.month || ''))];
    const domains = [...new Set(this.downloadsByDomain.map(item => item.domain || ''))];
    
    // Create datasets for each domain
    const datasets: ChartDataset<keyof ChartTypeRegistry, (number | [number, number] | Point | BubbleDataPoint | null)[]>[] | {
      label: any; data: any[]; borderColor: string; backgroundColor: string; // Add transparency
      tension: number; fill: boolean;
    }[] = [];
    const colors = ['#3399ff', '#2eb85c', '#f9b115', '#e55353', '#6f42c1'];
    
    domains.forEach((domain, index) => {
      const color = colors[index % colors.length];
      const domainData = periods.map(period => {
        const matchingItem = this.downloadsByDomain.find(
          item => item.domain === domain && item.month === period
        );
        return matchingItem ? matchingItem.count : 0;
      });
      
      datasets.push({
        label: domain,
        data: domainData,
        borderColor: color,
        backgroundColor: `${color}20`, // Add transparency
        tension: 0.4,
        fill: false
      });
    });
    
    this.visitorChart.data.labels = periods;
    this.visitorChart.data.datasets = datasets;
    this.visitorChart.update();
  }
}
}