import { Component, OnInit } from '@angular/core';
import { BlogService } from 'src/app/services/blog.service';

@Component({
  selector: 'app-featured-posts',
  templateUrl: './featured-posts.component.html',
  styleUrls: ['./featured-posts.component.css']
})
export class FeaturedPostsComponent implements OnInit {

  constructor(private blogService:BlogService) { }
  featuredBlogs;
  error: any;
  ngOnInit(): void {
    this.getfeaturedBlogs();
  }

  getfeaturedBlogs(){
    this.blogService.getFeaturedtBlogs().subscribe(
      (res: any) => this.featuredBlogs = res.data,
       error => this.error = error
      );
  }

}
