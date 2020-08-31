import {
    HttpEvent, HttpInterceptor, HttpHandler, HttpRequest,
    HttpResponse, HttpErrorResponse
} from '@angular/common/http';

import { Observable, throwError } from 'rxjs';
import { retry, catchError } from 'rxjs/operators';
export class HttpErrorInterceptor implements HttpInterceptor {

    errorMessage: any;

    intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
        return next.handle(request)
            .pipe(
                retry(1),
                catchError((errorResponse: HttpErrorResponse) => {

                    // if (errorResponse.error instanceof ErrorEvent) {
                    //     // client-side error
                    //     this.errorMessage = `Error: ${errorResponse.error.message}`;
                    //     console.log(this.errorMessage);
                    // } else {
                    //     // server-side error
                    //     this.errorMessage = `Error Code: ${errorResponse.status}\nMessage: ${errorResponse.message}`;
                    //     console.log(this.errorMessage);
                    // }
                    // //window.alert(this.errorMessage);

                    // // return an observable with a user-facing error message
                    // this.errorMessage = {
                    //     errorTitle: 'Oops! Request for document failed',
                    //     errorDesc: 'Something bad happened. Please try again later.'
                    // };
                    // return throwError(this.errorMessage);

                    // 1 - Create empty array to store errors
                    const errors = [];
                    if (errorResponse.error instanceof ErrorEvent) {
                        // client-side error
                        const errors = `Error: ${errorResponse.error.message}`;
                        console.log(errors);
                    } else {
                        // server-side error

                        // 2 - check if the error object is present in the response
                        if (errorResponse.error) {

                            // 3 - Push the main error message to the array of errors
                            errors.push(errorResponse.error);
                            //console.log(errorResponse.error.message)
                            // 4 - Check for Laravel form validation error messages object
                            if (errorResponse.error.errors) {

                                // 5 - For each error property (which is a form field)
                                for (const property in errorResponse.error.errors) {

                                    if (errorResponse.error.errors.hasOwnProperty(property)) {

                                        // 6 - Extract it's array of errors
                                        const propertyErrors: Array<string> = errorResponse.error.errors[property];

                                        // 7 - Push all errors in the array to the errors array
                                        propertyErrors.forEach(error => errors.push(error));
                                    }

                                }

                            }

                        }
                    }

                    //console.log(errors)

                    return throwError(errors);
                })
            )
    }
}