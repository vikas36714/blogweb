import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { FormBuilder, Validators, FormGroup,FormControl } from '@angular/forms';
import { BlogService } from 'src/app/services/blog.service';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.css']
})
export class ContactComponent implements OnInit {

  contactForm: FormGroup;
  submitted = false;
  error: any;

  constructor(private fb: FormBuilder, private blogService: BlogService, private router: Router) { }

  ngOnInit(): void {
    this.contactForm = this.fb.group({
      name: ['', Validators.required],
      email: ['', Validators.required],
      subject: ['', Validators.required],
      message: ['', Validators.required]
    });
  }

  get name() { return this.contactForm.get('name'); }
  get email() { return this.contactForm.get('email'); }
  get subject() { return this.contactForm.get('subject'); }
  get message() { return this.contactForm.get('message'); }


  onSubmit() {
    return this.blogService.contactForm(this.contactForm.value).subscribe(
      res => { 
            this.submitted = true;
            console.log('res'); console.log(res);
       },
      error => this.error = error
    );
  }

  gotoHome() {
    this.router.navigate(['/']);
  }

}
