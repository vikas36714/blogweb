import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { IUser } from 'src/app/interfaces/user';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  private serverUrl = environment.baseUrl;

  constructor(private http: HttpClient) { }

  getUsers(): Observable<IUser[]> {
    return this.http.get<IUser[]>(this.serverUrl + 'users');
  }

  getCurrentUser(): Observable<IUser[]> {
    return this.http.get<IUser[]>(this.serverUrl + 'currentUser');
  }

  editUser(id: number): Observable<IUser[]> {
    return this.http.get<IUser[]>(this.serverUrl + 'editUser/' + id);
  }

  updateUser(data, id: number): Observable<IUser[]> {
    return this.http.post<IUser[]>(this.serverUrl + 'updateUser/' + id, data);
  }

  deleteUser(id: number) {
    return this.http.delete(this.serverUrl + 'deleteUser/' + id);
  }

}
