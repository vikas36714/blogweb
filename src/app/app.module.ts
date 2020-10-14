import { BrowserModule, Title } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './layouts/header/header.component';
import { FooterComponent } from './layouts/footer/footer.component';
import { BannerComponent } from './modules/banner/banner.component';
import { AboutComponent } from './modules/about/about.component';
import { BlogComponent } from './modules/blog/blog.component';
import { ServicesComponent } from './modules/services/services.component';
import { FeaturedPostsComponent } from './modules/featured-posts/featured-posts.component';
import { CategoriesComponent } from './modules/categories/categories.component';
import { RecentPostsComponent } from './modules/recent-posts/recent-posts.component';
import { ContactComponent } from './modules/contact/contact.component';
import { SliderComponent } from './modules/slider/slider.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { LoginComponent } from './auth/login/login.component';
import { OurTeamComponent } from './modules/about/our-team/our-team.component';
import { TestimonialsComponent } from './modules/about/testimonials/testimonials.component';
import { OurCoreServicesComponent } from './modules/services/our-core-services/our-core-services.component';
import { TweetWidgetComponent } from './modules/blog/tweet-widget/tweet-widget.component';
import { TagsWeightComponent } from './modules/blog/tags-weight/tags-weight.component';
import { RegisterComponent } from './auth/register/register.component';
import { PostDetailsComponent } from './modules/post-details/post-details.component';
import { HttpClientModule } from '@angular/common/http';
import { httpInterceptorProviders } from './http-interceptors/index';
import { CarouselModule, CarouselConfig } from 'ngx-bootstrap/carousel';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { PaginationModule } from 'ngx-bootstrap/pagination';
import { DashboardComponent } from './admin/dashboard/dashboard.component';
import { AdminModule } from './admin/admin.module';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { NgHttpLoaderModule } from 'ng-http-loader';
import { HomeComponent } from './modules/home/home.component'; // <============


@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    FooterComponent,
    BannerComponent,
    AboutComponent,
    BlogComponent,
    ServicesComponent,
    FeaturedPostsComponent,
    CategoriesComponent,
    RecentPostsComponent,
    ContactComponent,
    SliderComponent,
    PageNotFoundComponent,
    LoginComponent,
    OurTeamComponent,
    TestimonialsComponent,
    OurCoreServicesComponent,
    TweetWidgetComponent,
    TagsWeightComponent,
    RegisterComponent,
    PostDetailsComponent,
    DashboardComponent,
    HomeComponent,

  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    CarouselModule,
    FormsModule,
    ReactiveFormsModule,
    NgHttpLoaderModule.forRoot(),
    PaginationModule.forRoot(),
    AdminModule,
    AppRoutingModule,
    BrowserAnimationsModule
  ],
  providers: [Title, httpInterceptorProviders,
    { provide: CarouselConfig, useValue: { interval: 1500, noPause: true, showIndicators: true } }],
  bootstrap: [AppComponent]
})
export class AppModule { }
