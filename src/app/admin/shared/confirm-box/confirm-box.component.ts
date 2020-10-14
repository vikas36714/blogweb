import { Component, EventEmitter, OnInit } from '@angular/core';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';

@Component({
  selector: 'app-confirm-box',
  templateUrl: './confirm-box.component.html',
  styleUrls: ['./confirm-box.component.css']
})
export class ConfirmBoxComponent implements OnInit {

  // modalRef: BsModalRef;
  message: string;
  blogId: number;
  public event: EventEmitter<any> = new EventEmitter();

  constructor(private modalRef: BsModalRef) { }

  ngOnInit(): void { }

  confirm(blogId: number): void {
    this.message = 'Confirmed!';
    this.event.emit({ blogId: blogId , success:true });
    this.modalRef.hide();
  }

  decline(): void {
    this.message = 'Declined!';
    this.modalRef.hide();
  }

}
