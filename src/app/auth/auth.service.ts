import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { IUser } from '../interfaces/user';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  serverUrl = environment.baseUrl;

constructor(private http: HttpClient) { }

  register(data: IUser[]): Observable<IUser[]>{
    // console.log('dddd ',data);
    return this.http.post<IUser[]>(this.serverUrl + 'register', data);
  }


}
