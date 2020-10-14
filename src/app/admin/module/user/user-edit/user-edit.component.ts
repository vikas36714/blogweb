import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { NotificationService } from 'src/app/admin/notification.service';
import { UserService } from 'src/app/admin/services/user.service';

@Component({
  selector: 'app-user-edit',
  templateUrl: './user-edit.component.html',
  styleUrls: ['./user-edit.component.css']
})
export class UserEditComponent implements OnInit {

  pageTitle: string = "Edit User";
  userEditForm: FormGroup;
  submitted: boolean= false;
  success: boolean = false;
  message: string;
  error: any;

  constructor(private fb: FormBuilder, private userService: UserService, private router: Router, private route: ActivatedRoute , private notifyService : NotificationService) { }


  showToasterSuccess(message){
    this.notifyService.showSuccess(message, "Success")
  }

  showToasterError(message){
      this.notifyService.showError(message, "Error")
  }

  showToasterInfo(message){
      this.notifyService.showInfo(message, "Info")
  }

  showToasterWarning(message){
      this.notifyService.showWarning(message, "Warning")
  }

  ngOnInit(): void {
     // Form initialization //
     this.userEditForm = this.fb.group({
      user_id: [''],
      first_name: ['', [Validators.required]],
      last_name: ['', [Validators.required]],
      email: ['', [Validators.required]],
      is_active: ['1']
    });

    const id = +this.route.snapshot.paramMap.get('id');
    this.userService.editUser(id).subscribe((res:any) => {
      this.userEditForm.patchValue({
        user_id: res.data.id,
        first_name: res.data.first_name,
        last_name: res.data.last_name,
        email: res.data.email,
        is_active: res.data.is_active,
      });
    });

  }

  //Get form controls validations //
  get form_controls(){ return this.userEditForm.controls; }

  onSubmit(){
    this.submitted = true;
    // Stop processing invalid form submission //
    if(this.userEditForm.invalid){ return; }

    //  processing form submission data to server //
    const formData = new FormData();

    formData.append('first_name', this.userEditForm.get('first_name').value);
    formData.append('last_name', this.userEditForm.get('last_name').value);
    formData.append('email', this.userEditForm.get('email').value);
    formData.append('is_active', this.userEditForm.get('is_active').value);
    const userId = this.userEditForm.get('user_id').value;
    this.userService.updateUser(formData, userId).subscribe((res: any) => {
        this.router.navigate(['admin/user']).then(() => this.showToasterSuccess(res.message));
    },
    error => this.router.navigate(['admin/user']).then(() => this.showToasterError(error[0].message))
    );

  }

}
