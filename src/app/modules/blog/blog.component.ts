import { Component, OnInit } from '@angular/core';
import { BlogService } from 'src/app/services/blog.service';
import { PageChangedEvent } from 'ngx-bootstrap/pagination';

@Component({
  selector: 'app-blog',
  templateUrl: './blog.component.html',
  styleUrls: ['./blog.component.css']
})
export class BlogComponent implements OnInit {

  blogs:any;
  error;
  contentArray1 = [].fill('');
  contentArray2 = [];
  totalItems;
  maxSize = 5;

  constructor(private blogService: BlogService) { }

  ngOnInit(): void {
    this.blogService.getBlogs().subscribe( (res: any) => {

      this.contentArray1 = res.data;
      this.totalItems = this.contentArray1.length;
      this.contentArray2 = this.contentArray1.map(
        (res:any) => {
          return res;
        });
      //console.log(this.contentArray2.slice(0, 10));
      this.blogs = this.contentArray2.slice(0, 10);
    },
    error => this.error = error );
  }
 
  pageChanged(event: PageChangedEvent): void {
    const startItem = (event.page - 1) * event.itemsPerPage;
    const endItem = event.page * event.itemsPerPage;
    this.blogs = this.contentArray1.slice(startItem, endItem);
  }

}
