import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class AboutService {

  serverUrl = environment.baseUrl;

constructor(private http: HttpClient) { }

  getPages() :Observable<any>{
    return this.http.get<any>(this.serverUrl + 'about');
  }

  getOurTeam() :Observable<any>{
    return this.http.get<any>(this.serverUrl + 'ourTeam');
  }

}
