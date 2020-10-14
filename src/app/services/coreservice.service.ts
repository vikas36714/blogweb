import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class CoreserviceService {

  serverUrl = environment.baseUrl;

  constructor(private http: HttpClient) { }

  getService(): Observable<any> {
    return this.http.get<any>(this.serverUrl + 'services');
  }

  getCoreServices(): Observable<any> {
    return this.http.get<any>(this.serverUrl + 'coreServices');
  }

}
