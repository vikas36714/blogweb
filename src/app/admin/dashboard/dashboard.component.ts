import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/auth/auth.service';
import { Router } from '@angular/router';
import { BlogService } from '../services/blog.service';
import { IBlog } from 'src/app/interfaces/blog';
import { UserService } from '../services/user.service';
import { IUser } from 'src/app/interfaces/user';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  pageTitle: string = 'Dashboard';
  blogs: IBlog[] = [];
  error: any;
  currentUser: any;

  constructor(private authService: AuthService, private router: Router, private blogService: BlogService, private userService: UserService) { }

  ngOnInit(): void {
    if (!this.authService.isLoggedIn()) {
      this.router.navigate(['login']);
    }

    this.getCurrentUser();

    this.blogService.getBlogs().subscribe((res: any) => {
      this.blogs = res.data;
    },
      error => this.error = error
    );

  }

  getCurrentUser(){
    this.userService.getCurrentUser().subscribe((res:any) => {
      this.currentUser = res.data;
    },
    error => this.error = error
    );
  }

  logout() {
    this.authService.logout();
  }


}
