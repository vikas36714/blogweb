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
    return this.http.get<ICategory>(this.serverUrl + 'adminCategories');
  }

  getCategory(id: number): Observable<ICategory[]> {
    return this.http.get<ICategory[]>(this.serverUrl + 'getCategory/' + id);
  }

  createCategory(data): Observable<ICategory[]> {
    return this.http.post<ICategory[]>(this.serverUrl + 'createCategory', data);
  }

  updateCategory(data, id: number): Observable<ICategory[]> {
    return this.http.post<ICategory[]>(this.serverUrl + 'updateCategory/' + id, data);
  }

  deleteCategory(id: number) {
    return this.http.delete(this.serverUrl + 'deleteCategory/' + id);
  }

}
