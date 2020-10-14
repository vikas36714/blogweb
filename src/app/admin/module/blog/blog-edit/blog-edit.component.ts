import { Component, OnInit } from '@angular/core';
import { Validators, FormBuilder, FormGroup } from '@angular/forms';
import { BlogService } from 'src/app/admin/services/blog.service';
import { CategoryService } from 'src/app/admin/services/category.service';
import { NotificationService } from 'src/app/admin/notification.service';
import { Router, ActivatedRoute } from '@angular/router';
import { ICategory } from 'src/app/interfaces/category';
import { IBlog } from 'src/app/interfaces/blog';

@Component({
  selector: 'app-blog-edit',
  templateUrl: './blog-edit.component.html'
})
export class BlogEditComponent implements OnInit {

  pageTitle: string = "Edit Blog";
  editForm: FormGroup;
  blog: IBlog;
  submitted: boolean= false;
  success: boolean = false;
  message: string;
  categories: ICategory;
  uploadError: string;
  imagePath: string;
  error: any;

  constructor(private fb: FormBuilder, private blogService: BlogService, private categoryService: CategoryService, private router: Router,private route: ActivatedRoute ,private notifyService : NotificationService) { }


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
     this.editForm = this.fb.group({
      id: ['', [Validators.required]],
      title: ['', [Validators.required]],
      category_id: ['', [Validators.required]],
      is_featured: ['0'],
      is_active: ['1'],
      image: [''],
      description: ['', [Validators.required]],
    });

    // Getting categories for drop down //
    this.categoryService.getCategories().subscribe(
      (res: any) => this.categories = res.data
    );

    const id = +this.route.snapshot.paramMap.get('id');
    this.blogService.getBlog(id).subscribe((res:any) => {
      this.editForm.patchValue({
        id: res.data.id,
        title: res.data.title,
        category_id: res.data.category_id,
        description: res.data.description,
        is_featured: res.data.is_featured,
        is_active: res.data.is_active,
      });
      this.imagePath = res.data.image;
    });


  }

  onSelectedFile(event) {
    if(event.target.files.length > 0 ) {
      const file = event.target.files['0'];
      this.editForm.get('image').setValue(file ? file : '');
    }
  }

  //Get form controls validations //
  get form_controls(){ return this.editForm.controls; }

  onSubmit(){
    // Stop processing form submission if form data is invalid //
    if(this.editForm.invalid){ return; }

    //  processing form submission data to server //
    const formData = new FormData();

    formData.append('title', this.editForm.get('title').value);
    formData.append('category_id', this.editForm.get('category_id').value);
    formData.append('is_featured', this.editForm.get('is_featured').value);
    formData.append('is_active', this.editForm.get('is_active').value);
    formData.append('image', this.editForm.get('image').value);
    // console.log(formData.get("image"))
    formData.append('description', this.editForm.get('description').value);
    const blogid = this.editForm.get('id').value;

    this.blogService.updateBlog(formData, blogid).subscribe((res: any) => {
        this.router.navigate(['admin/blog']).then(() => this.showToasterSuccess(res.message));
    },
    error => this.router.navigate(['admin/blog']).then(() => this.showToasterError(error[0].message))
    );

  }

}
