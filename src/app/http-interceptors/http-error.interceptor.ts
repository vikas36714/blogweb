import { HttpEvent, HttpInterceptor, HttpHandler, HttpRequest,
         HttpResponse, HttpErrorResponse
    } from '@angular/common/http';

import { Observable, throwError } from 'rxjs';
import { retry, catchError } from 'rxjs/operators';
export class HttpErrorInterceptor implements HttpInterceptor {

    errorMessage:any;

    intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
        return next.handle(request)
            .pipe(
                retry(1),
                catchError((error: HttpErrorResponse) => {
                    
                    if (error.error instanceof ErrorEvent) {
                        // client-side error
                        this.errorMessage = `Error: ${error.error.message}`;
                        console.log(this.errorMessage);
                    } else {
                        // server-side error
                        this.errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
                        console.log(this.errorMessage);
                    }
                    //window.alert(this.errorMessage);

                    // return an observable with a user-facing error message
                    this.errorMessage = {
                        errorTitle: 'Oops! Request for document failed',
                        errorDesc: 'Something bad happened. Please try again later.'
                    };
                    return throwError(this.errorMessage);
                })
            )
    }
}