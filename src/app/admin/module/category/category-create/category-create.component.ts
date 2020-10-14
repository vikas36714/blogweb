import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { NotificationService } from 'src/app/admin/notification.service';
import { CategoryService } from 'src/app/admin/services/category.service';

@Component({
  selector: 'app-category-create',
  templateUrl: './category-create.component.html'
})
export class CategoryCreateComponent implements OnInit {

  pageTitle: string = "Create Category";
  categoryForm: FormGroup;
  submitted: boolean= false;
  success: boolean = false;
  message: string;
  error: any;

  constructor(private fb: FormBuilder, private categoryService: CategoryService, private router: Router, private notifyService : NotificationService) { }


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
     this.categoryForm = this.fb.group({
      category_name: ['', [Validators.required]],
      is_featured: ['0'],
      is_active: ['1']
    });

  }

  //Get form controls validations //
  get form_controls(){ return this.categoryForm.controls; }

  onSubmit(){
    this.submitted = true;
    // Stop processing invalid form submission //
    if(this.categoryForm.invalid){ return; }

    //  processing form submission data to server //
    const formData = new FormData();

    formData.append('category_name', this.categoryForm.get('category_name').value);
    formData.append('is_featured', this.categoryForm.get('is_featured').value);
    formData.append('is_active', this.categoryForm.get('is_active').value);

    this.categoryService.createCategory(formData).subscribe((res: any) => {
        this.router.navigate(['admin/category']).then(() => this.showToasterSuccess(res.message));
    },
    error => this.router.navigate(['admin/category']).then(() => this.showToasterError(error[0].message))
    );

  }

}
