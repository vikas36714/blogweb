import { Component, OnInit } from '@angular/core';
import { BlogService } from 'src/app/services/blog.service';

@Component({
  selector: 'app-banner',
  templateUrl: './banner.component.html',
  styleUrls: ['./banner.component.css']
})
export class BannerComponent implements OnInit {

  blogs: any;
  error: any;

  constructor(private blogService: BlogService) { }

  ngOnInit(): void {
    this.blogService.getFeaturedtBlogs().subscribe(
      (res: any) => {
        this.blogs = res.data
      },
       error => this.error = error
      );
  }

}
