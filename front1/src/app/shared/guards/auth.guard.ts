import { Injectable } from '@angular/core';
import { 
  CanActivate, 
  ActivatedRouteSnapshot, 
  RouterStateSnapshot, 
  Router 
} from '@angular/router';
import { AuthService } from '../../auth/services/auth.service';
import { Role } from '../../auth/models/auth.models';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {
  
  constructor(
    private authService: AuthService,
    private router: Router
  ) {}

  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
  ): boolean {
    // Check if user is logged in
    if (!this.authService.isLoggedIn()) {
      this.router.navigate(['/login']);
      return false;
    }

    // If a specific role is required
    const requiredRole = route.data['role'] as Role;
    if (requiredRole && !this.authService.hasRole(requiredRole)) {
      // Redirect to appropriate dashboard based on user's role
      const user = this.authService.getCurrentUser();
      if (user) {
        switch (user.role) {
          case Role.ADMIN:
            this.router.navigate(['/dashboard/admin']);
            break;
          case Role.MODERATEUR:
            this.router.navigate(['/dashboard/moderateur']);
            break;
          case Role.UTILISATEUR:
            this.router.navigate(['/dashboard/utilisateur']);
            break;
          default:
            this.router.navigate(['/login']);
        }
      }
      return false;
    }

    return true;
  }
}