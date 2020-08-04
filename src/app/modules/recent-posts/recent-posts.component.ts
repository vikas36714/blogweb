import { Component, OnInit } from '@angular/core';
import { BlogService } from 'src/app/services/blog.service';

@Component({
  selector: 'app-recent-posts',
  templateUrl: './recent-posts.component.html',
  styleUrls: ['./recent-posts.component.css']
})
export class RecentPostsComponent implements OnInit {

  blogs:any
  error:any

  constructor(private blogService: BlogService) { }

  ngOnInit(): void {
    this.getRecentBlogs();
  }

  getRecentBlogs(){
    this.blogService.getRecentBlogs().subscribe(
      (res: any) => this.blogs = res.data,
      error => this.error = error
    );
  }

}
