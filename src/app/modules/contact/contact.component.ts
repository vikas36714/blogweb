import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { FormBuilder, Validators, FormGroup,FormControl } from '@angular/forms';
import { BlogService } from 'src/app/services/blog.service';
import { IContact } from 'src/app/interfaces/contact';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.css']
})
export class ContactComponent implements OnInit {

  contactForm: FormGroup;
  submitted = false;
  error: any;
  success: boolean = false;

  constructor(private fb: FormBuilder, private blogService: BlogService, private router: Router) { }

  ngOnInit(): void {
    this.contactForm = this.fb.group({
      name: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      subject: ['', Validators.required],
      message: ['', Validators.required]
    });
  }
  
  // convenience getter for easy access to form fields
  get form_controls() { return this.contactForm.controls; }

  onSubmit() {
    this.submitted = true;
    if (this.contactForm.invalid) {
      console.log('invalid');
      return;
      }
      // display form values on success
      //alert('SUCCESS!! :-)\n\n' + JSON.stringify(this.contactForm.value, null, 4));
    return this.blogService.contactForm(this.contactForm.value).subscribe(
      (res: IContact[]) => { 
             this.success = true;
             this.submitted = false;
             this.contactForm.reset();
       },
      error => this.error = error
    );
  }

  // onReset() {
  //   this.submitted = false;
  //   this.contactForm.reset();
  // }


}
