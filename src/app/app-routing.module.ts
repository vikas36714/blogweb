import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { AboutComponent } from './modules/about/about.component';
import { ServicesComponent } from './modules/services/services.component';
import { BlogComponent } from './modules/blog/blog.component';
import { LoginComponent } from './auth/login/login.component';
import { ContactComponent } from './modules/contact/contact.component';
import { RegisterComponent } from './auth/register/register.component';
import { PostDetailsComponent } from './modules/post-details/post-details.component';


const routes: Routes = [
  {path:'', redirectTo: '', pathMatch: 'full'},
  {path: 'about', component: AboutComponent},
  {path: 'services', component: ServicesComponent},
  {path: 'blog', component: BlogComponent},
  {path: 'blog/:id', component: PostDetailsComponent},
  {path: 'login', component: LoginComponent},
  {path: 'register', component: RegisterComponent},
  {path: 'contact', component: ContactComponent},
  {path:'**', component: PageNotFoundComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
