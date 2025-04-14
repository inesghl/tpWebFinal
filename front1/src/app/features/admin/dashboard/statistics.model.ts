export interface OverallStats {
    totalUsers: number;
    totalResearchers: number;
    totalArticles: number;
    totalDomains: number;
    
  }
  
  export interface DomainStat {
    domain: string;
    count: number;
    period?: string;
    month?: string;
  }