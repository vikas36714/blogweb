import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { IBlog } from 'src/app/interfaces/blog';

@Injectable({
  providedIn: 'root'
})
export class BlogService {

  private serverUrl = environment.baseUrl;

  constructor(private http: HttpClient) { }
  
  getBlogs(): Observable<IBlog[]> {
    return this.http.get<IBlog[]>(this.serverUrl + 'blogs')
  }

}
