import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { Observable } from 'rxjs';
import { IContact } from '../interfaces/contact';

@Injectable({
  providedIn: 'root'
})
export class BlogService {

  serverUrl = environment.baseUrl;
constructor(private http: HttpClient) { }

  getBlogs(): Observable<any> {
    return this.http.get<any>(this.serverUrl + 'blogs')
  }

  getBlog(id: number) {
    return this.http.get<any>(this.serverUrl + 'blog/' + id)
  }

  getFeaturedtBlogs(): Observable<any>{
    return this.http.get<any>(this.serverUrl + 'featured_blogs');
  }

  getRecentBlogs(): Observable<any> {
    return this.http.get<any>(this.serverUrl + 'recent_blogs')
  }

  contactForm(data: any): Observable<IContact[]> {
    return this.http.post<IContact[]>(this.serverUrl + 'contact', data)
  }

  getGallery(): Observable<any> {
    return this.http.get<any>(this.serverUrl + 'gallery')
  }

}
