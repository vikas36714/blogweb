import { Component, OnInit } from '@angular/core';
import { FormGroup, Validators, FormBuilder } from '@angular/forms';

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
  constructor(private fb: FormBuilder) { }

  ngOnInit(): void {
     // Form initialization //
     this.blogForm = this.fb.group({
      title: ['', [Validators.required]],
      category: ['', [Validators.required]],
      is_featured: ['', [Validators.required]],
      is_active: ['', [Validators.required]],
    });
  }

  //Get form controls validations //
  get form_controls(){ return this.blogForm.controls; }

  onSubmit(){

  }

}
