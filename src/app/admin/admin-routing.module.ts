import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DashboardComponent } from './dashboard/dashboard.component';
import { CreateComponent } from './module/blog/create/create.component';
import { EditComponent } from './module/blog/edit/edit.component';
import { ListComponent } from './module/blog/list/list.component';


const routes: Routes = [
  {path: 'admin', component: DashboardComponent,
  children: [
    { path: '', children: [
      {path: 'blog', component: ListComponent},
      {path: 'blog/create', component: CreateComponent},
      {path: 'blog/edit', component: EditComponent},
    ]}
  ]}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminRoutingModule { }
