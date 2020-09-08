import { HTTP_INTERCEPTORS } from '@angular/common/http';
import { HttpErrorInterceptor } from './http-error.interceptor';
import { LoaderInterceptorService } from './loader-interceptor.service';
import { AuthInterceptor } from './auth-interceptor';

export const httpInterceptorProviders = [
    { provide : HTTP_INTERCEPTORS, useClass: HttpErrorInterceptor, multi: true},
    //{ provide : HTTP_INTERCEPTORS, useClass: LoaderInterceptorService, multi: true},
    { provide : HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi: true},
]