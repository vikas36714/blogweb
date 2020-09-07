import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/auth/auth.service';
import { Router } from '@angular/router';
import { BlogService } from '../services/blog.service';
import { IBlog } from 'src/app/interfaces/blog';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  pageTitle: string = 'Dashboard';
  blogs: IBlog[] = [];
  error: any;

  constructor(private authService: AuthService, private router: Router, private blogService: BlogService) { }

  ngOnInit(): void {
    if (!this.authService.isLoggedIn()) {
      this.router.navigate(['login']);
    }

    this.blogService.getBlogs().subscribe((res: any) => {
      this.blogs = res.data;
    },
      error => this.error = error
    );

  }

  logout() {
    this.authService.logout();
  }


}
