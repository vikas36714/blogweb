import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AdminRoutingModule } from './admin-routing.module';
import { BlogListComponent } from './module/blog/blog-list/blog-list.component';
import { BlogCreateComponent } from './module/blog/blog-create/blog-create.component';
import { BlogEditComponent } from './module/blog/blog-edit/blog-edit.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ToastrModule } from 'ngx-toastr';
import { ConfirmBoxComponent } from './shared/confirm-box/confirm-box.component';
import { ModalModule } from 'ngx-bootstrap/modal';
import { CategoryCreateComponent } from './module/category/category-create/category-create.component';
import { CategoryEditComponent } from './module/category/category-edit/category-edit.component';
import { CategoryListComponent } from './module/category/category-list/category-list.component';
import { AboutComponent } from './module/about/about.component';
import { ProfileComponent } from './module/profile/profile.component';
import { UserListComponent } from './module/user/user-list/user-list.component';
import { UserCreateComponent } from './module/user/user-create/user-create.component';
import { UserEditComponent } from './module/user/user-edit/user-edit.component';

@NgModule({
  declarations: [ BlogCreateComponent, BlogEditComponent, BlogListComponent, ConfirmBoxComponent, CategoryCreateComponent, CategoryEditComponent, CategoryListComponent, AboutComponent, ProfileComponent, UserListComponent, UserCreateComponent, UserEditComponent],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    BrowserAnimationsModule,
    ToastrModule.forRoot(),
    ModalModule.forRoot(),
    AdminRoutingModule
  ]
})
export class AdminModule { }
