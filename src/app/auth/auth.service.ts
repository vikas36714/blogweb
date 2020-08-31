import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { IUser } from '../interfaces/user';
import { map } from 'rxjs/internal/operators/map';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  serverUrl = environment.baseUrl;
  redirectUrl: string;

constructor(private http: HttpClient) { }

  register(data: IUser[]): Observable<IUser[]>{
    return this.http.post<IUser[]>(this.serverUrl + 'register', data);
  }

  login(email, password) {
    return this.http.post<any>(this.serverUrl + 'login', {email: email, password: password}).pipe(map( user => {
      console.log(user);
      if(user && user.data.authToken){
        localStorage.setItem('authToken',   JSON.stringify(user.data.authToken));
      }
    }));
  }

  isLoggedIn(){
    if(localStorage.getItem('authToken')){
      return true;
    }else{
      return false;
    }
  }


}
