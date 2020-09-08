import { Component, OnInit } from '@angular/core';
import { FormGroup, Validators, FormBuilder } from '@angular/forms';
import { BlogService } from '../../../services/blog.service';
import { CategoryService } from 'src/app/admin/services/category.service';
import { ICategory } from 'src/app/interfaces/category';

@Component({
  selector: 'app-create',
  templateUrl: './create.component.html',
  styleUrls: ['./create.component.css']
})
export class CreateComponent implements OnInit {

  pageTitle: string = "Create Blog";
  blogForm: FormGroup;
  submitted: boolean= false;
  success: boolean = false;
  message: string;
  categories: ICategory;
  uploadError: string;
  imagePath: string;
  error: any;

  constructor(private fb: FormBuilder, private blogService: BlogService, private categoryService: CategoryService) { }

  ngOnInit(): void {
     // Form initialization //
     this.blogForm = this.fb.group({
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
  }

  onSelectedFile(event) {
    if(event.target.files.length > 0 ) {
      const file = event.target.files['0'];
      this.blogForm.get('image').setValue(file ? file : '');
    }
  }

  //Get form controls validations //
  get form_controls(){ return this.blogForm.controls; }

  onSubmit(){
    const formData = new FormData();
    
    formData.append('title', this.blogForm.get('title').value);
    formData.append('category_id', this.blogForm.get('category_id').value);
    formData.append('is_featured', this.blogForm.get('is_featured').value);
    formData.append('is_active', this.blogForm.get('is_active').value);
    formData.append('image', this.blogForm.get('image').value);
    // console.log(formData.get("image"))
    formData.append('description', this.blogForm.get('description').value);

    this.blogService.createBlog(formData).subscribe((res: any) => {
      console.log(res);
    },
    error => this.error = error
    );

  }

}