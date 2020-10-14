import { Component, OnInit, TemplateRef } from '@angular/core';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { NotificationService } from 'src/app/admin/notification.service';
import { UserService } from 'src/app/admin/services/user.service';
import { ConfirmBoxComponent } from 'src/app/admin/shared/confirm-box/confirm-box.component';
import { IUser } from 'src/app/interfaces/user';

@Component({
  selector: 'app-user-list',
  templateUrl: './user-list.component.html',
  styleUrls: ['./user-list.component.css']
})
export class UserListComponent implements OnInit {

  pageTitle: String = 'Users List';
  users: IUser[] = [];
  error: any;
  modalRef: BsModalRef;

  constructor(private userService: UserService, private modalService: BsModalService, private notifyService: NotificationService,) { }

  showToasterInfo(message) {
    this.notifyService.showInfo(message, 'Info');
  }

  ngOnInit(): void {
    this.userService.getUsers().subscribe(
      (res: any) => {
        this.users = res.data;
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
    this.userService.deleteUser(+blogId).subscribe(
      (res: any) => {
        this.showToasterInfo(res.message);
        this.ngOnInit();
      },
      (error) => (this.error = error)
    );
  }

}
