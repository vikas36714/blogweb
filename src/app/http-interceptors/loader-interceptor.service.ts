import { Injectable } from '@angular/core';
import { HttpInterceptor, HttpRequest, HttpHandler, HttpEvent, HttpResponse } from '@angular/common/http';
import { LoaderService } from '../services/loader.service';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class LoaderInterceptorService implements HttpInterceptor{

  private requests: HttpRequest<any>[] = [];

  constructor(private loaderService: LoaderService) { }

  removeRequests(req: HttpRequest<any>){
    const i = this.requests.indexOf(req);
    if(i>0){
      this.requests.splice(i, 1);
    }
    this.loaderService.isLoading.next(this.requests.length > 0);
  }

  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>>{
    this.requests.push(req);

    console.log("No of requests---->" + this.requests.length);

    this.loaderService.isLoading.next(true);
    return Observable.create(observer => {
      const subscription = next.handle(req).subscribe(
        event => {
          if(event instanceof HttpResponse){
            this.removeRequests(req);
            observer.next(event);
          }
        },
        err => {
          alert('error' + err);
          this.removeRequests(req);
          observer.error(err);
        },
        () => {
          this.removeRequests(req);
          observer.complete();
        });
        // remove request from queue when cancelled
        return () => {
          this.removeRequests(req);
          subscription.unsubscribe();
        };
    });
  }
}
