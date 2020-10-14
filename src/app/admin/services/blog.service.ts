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
    return this.http.get<IBlog[]>(this.serverUrl + 'adminblogs');
  }

  getBlog(id: number): Observable<IBlog[]> {
    return this.http.get<IBlog[]>(this.serverUrl + 'adminblog/' + id);
  }

  createBlog(data): Observable<IBlog[]> {
    return this.http.post<any>(this.serverUrl + 'createblog', data);
  }

  updateBlog(data, id: number): Observable<IBlog[]> {
    return this.http.post<any>(this.serverUrl + 'updateblog/' + id, data);
  }

  deleteBlog(id: number) {
    return this.http.delete(this.serverUrl + 'deleteblog/' + id);
  }

}
