import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/auth/auth.service';
import { Router } from '@angular/router';
import { IBlog } from 'src/app/interfaces/blog';
import { BlogService } from 'src/app/admin/services/blog.service';

@Component({
  selector: 'app-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css']
})
export class ListComponent implements OnInit {

  pageTitle: string = 'Blog list';
  blogs: IBlog[] = [];
  error: any;

  constructor(private authService: AuthService, private router: Router, private blogService: BlogService) { }

  ngOnInit(): void {
    if(!this.authService.isLoggedIn()){
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
