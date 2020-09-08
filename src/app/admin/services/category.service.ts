import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';
import { ICategory } from 'src/app/interfaces/category';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {
  private serverUrl = environment.baseUrl;

constructor(private http: HttpClient) { }

getCategories(): Observable<ICategory> {
  return this.http.get<ICategory>(this.serverUrl + 'categories');
}

}
