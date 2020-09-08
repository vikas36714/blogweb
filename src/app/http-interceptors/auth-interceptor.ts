import { Injectable } from '@angular/core';
import { HttpClient, HttpBackend, HttpRequest, HttpHandler, HttpInterceptor, HttpEvent } from '@angular/common/http';
import { AuthService } from '../auth/auth.service';
import { Observable } from 'rxjs/internal/Observable';

@Injectable()

export class AuthInterceptor implements HttpInterceptor {

    private http: HttpClient;

    constructor(private authService: AuthService, handler: HttpBackend) {
        this.http = new HttpClient(handler);
    }

    intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {

        if (this.authService.isLoggedIn()) {
            const authToken = this.authService.getAuthorizationToken();
            // console.log(authToken);
            req = req.clone({
                setHeaders:
                    { Authorization: `Bearer ${authToken}`},
                }
            );
            // console.log(req);
        }

        return next.handle(req);
    }
}
