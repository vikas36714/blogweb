import { HTTP_INTERCEPTORS } from '@angular/common/http';
import { HttpErrorInterceptor } from './http-error.interceptor';
import { LoaderInterceptorService } from './loader-interceptor.service';

export const httpInterceptorProviders = [
    { provide : HTTP_INTERCEPTORS, useClass: HttpErrorInterceptor, multi: true},
    // { provide : HTTP_INTERCEPTORS, useClass: LoaderInterceptorService, multi: true},
]