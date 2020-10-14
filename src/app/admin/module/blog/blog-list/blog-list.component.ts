import { Component, OnInit, TemplateRef, EventEmitter } from '@angular/core';
import { AuthService } from 'src/app/auth/auth.service';
import { Router } from '@angular/router';
import { IBlog } from 'src/app/interfaces/blog';
import { BlogService } from 'src/app/admin/services/blog.service';
import { NotificationService } from 'src/app/admin/notification.service';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { ConfirmBoxComponent } from 'src/app/admin/shared/confirm-box/confirm-box.component';

@Component({
  selector: 'app-blog-list',
  templateUrl: './blog-list.component.html',
})
export class BlogListComponent implements OnInit {
  pageTitle: string = 'Blog list';
  blogs: IBlog[] = [];
  error: any;
  modalRef: BsModalRef;
  public event: EventEmitter<any> = new EventEmitter();

  constructor(
    private authService: AuthService,
    private router: Router,
    private blogService: BlogService,
    private notifyService: NotificationService,
    private modalService: BsModalService
  ) {}

  showToasterInfo(message) {
    this.notifyService.showInfo(message, 'Info');
  }

  ngOnInit(): void {
    if (!this.authService.isLoggedIn()) {
      this.router.navigate(['login']);
    }

    this.blogService.getBlogs().subscribe(
      (res: any) => {
        this.blogs = res.data;
      },
      (error) => (this.error = error)
    );
  }

  openModal(id: TemplateRef<any>) {
    const initialState = {
      blogId: id,
    };
    this.modalRef = this.modalService.show(ConfirmBoxComponent, {
      class: 'modal-sm',
      initialState,
    });
    this.modalRef.content.closeBtnName = 'Close';
    this.modalRef.content.event.subscribe((res) => {
      this.onDelete(res.blogId);
    });
  }

  onDelete(blogId: number) {
    this.blogService.deleteBlog(+blogId).subscribe(
      (res: any) => {
        this.showToasterInfo(res.message);
        this.ngOnInit();
      },
      (error) => (this.error = error)
    );
  }

  logout() {
    this.authService.logout();
  }
}
