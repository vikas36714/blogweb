import { Component, EventEmitter, OnInit, TemplateRef } from '@angular/core';
import { Router } from '@angular/router';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ICategory } from 'src/app/interfaces/category';
import { CategoryService } from 'src/app/admin/services/category.service';
import { ConfirmBoxComponent } from 'src/app/admin/shared/confirm-box/confirm-box.component';
import { AuthService } from 'src/app/auth/auth.service';
import { NotificationService } from 'src/app/admin/notification.service';

@Component({
  selector: 'app-category-list',
  templateUrl: './category-list.component.html'
})
export class CategoryListComponent implements OnInit {

  pageTitle: string = 'Category list';
  categories: ICategory[] = [];
  error: any;
  modalRef: BsModalRef;
  public event: EventEmitter<any> = new EventEmitter();


  constructor(private authService: AuthService, private router: Router, private categoryService: CategoryService, private notifyService: NotificationService, private modalService: BsModalService) { }

  showToasterInfo(message){
    this.notifyService.showInfo(message, "Info")
  }

  ngOnInit(): void {
    if(!this.authService.isLoggedIn()){
      this.router.navigate(['login']);
    }

    this.categoryService.getCategories().subscribe((res: any) => {
           this.categories = res.data;
        },
        error => this.error = error
        );

  }

  openModal(id: TemplateRef<any>) {
    const initialState = {
      blogId: id
    };
    this.modalRef = this.modalService.show(ConfirmBoxComponent, {class: 'modal-sm', initialState});
    this.modalRef.content.closeBtnName = 'Close';
    this.modalRef.content.event.subscribe(res => {
      this.onDelete(res.blogId);
    });
  }



  onDelete(blogId: number) {
      this.categoryService.deleteCategory(+blogId).subscribe(
        (res: any) => {
          this.showToasterInfo(res.message);
          this.ngOnInit();
        },
        error => this.error = error
      );
  }

}
