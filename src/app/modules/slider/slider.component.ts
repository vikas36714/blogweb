import { Component, OnInit } from '@angular/core';
import { BlogService } from 'src/app/services/blog.service';

@Component({
  selector: 'app-slider',
  templateUrl: './slider.component.html',
  styleUrls: ['./slider.component.css']
})
export class SliderComponent implements OnInit {

  blogs: any;
  error: any;
  itemsPerSlide = 5;
  singleSlideOffset = true;
  noWrap = true;
  noWrapSlides = true;
  
  constructor(private blogService: BlogService) { }

  ngOnInit(): void {
    this.blogService.getFeaturedtBlogs().subscribe(
      (res: any) => {
        this.blogs = res.data
      },
       error => this.error = error );
  }

}
