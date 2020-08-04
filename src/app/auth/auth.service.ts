import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  serverUrl = environment.baseUrl;

constructor(private http: HttpClient) { }

  register(data: any): Observable<any>{
    // console.log('dddd ',data);
    return this.http.post<any>(this.serverUrl + 'register', data);
  }


}
