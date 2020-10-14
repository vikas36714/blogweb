import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from '../auth/auth.guard';
import { DashboardComponent } from './dashboard/dashboard.component';
import { AboutComponent } from './module/about/about.component';
import { BlogCreateComponent } from './module/blog/blog-create/blog-create.component';
import { BlogEditComponent } from './module/blog/blog-edit/blog-edit.component';
import { BlogListComponent } from './module/blog/blog-list/blog-list.component';
import { CategoryCreateComponent } from './module/category/category-create/category-create.component';
import { CategoryEditComponent } from './module/category/category-edit/category-edit.component';
import { CategoryListComponent } from './module/category/category-list/category-list.component';
import { ProfileComponent } from './module/profile/profile.component';
import { UserCreateComponent } from './module/user/user-create/user-create.component';
import { UserEditComponent } from './module/user/user-edit/user-edit.component';
import { UserListComponent } from './module/user/user-list/user-list.component';


const routes: Routes = [
  {path: 'admin', component: DashboardComponent, canActivate: [AuthGuard],
  children: [
    { path: '', children: [
      {path: 'blog', component: BlogListComponent},
      {path: 'blog/create', component: BlogCreateComponent},
      {path: 'blog/edit/:id', component: BlogEditComponent},
      {path: 'category', component: CategoryListComponent},
      {path: 'category/create', component: CategoryCreateComponent},
      {path: 'category/edit/:id', component: CategoryEditComponent},
      {path: 'user', component: UserListComponent},
      {path: 'user/create', component: UserCreateComponent},
      {path: 'user/edit/:id', component: UserEditComponent},
      {path: 'about', component: AboutComponent},
      {path: 'profile', component: ProfileComponent}
    ]}
  ]}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminRoutingModule { }
