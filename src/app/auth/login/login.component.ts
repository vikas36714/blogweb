import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { AuthService } from '../auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  loginForm: FormGroup;
  submitted: boolean = false;
  message: string;
  success: boolean = false;
  error: any;

  constructor(private fb: FormBuilder, private authService: AuthService, private router: Router) { }

  ngOnInit(): void {
    // Form initialization //
    this.loginForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', Validators.required]
    });

  }

  // Get form controls validations //
  get form_controls(){ return this.loginForm.controls; }

  // Login function //
  login() {
    this.submitted = true;
    // stop here if form is invalid
    if(this.loginForm.invalid){ return ; }
    this.authService.login(this.loginForm.value.email, this.loginForm.value.password).subscribe( (res:any) => {
      this.submitted = false;
      if(this.authService.isLoggedIn()){
        const redirect = this.authService.redirectUrl ? this.authService.redirectUrl : '/admin';
        this.router.navigate([redirect]);
      }
    },
    error => {
      this.error = error;
      // this.success = error[0].success;
      // this.message = error[0].message;
     }
    )

  }

}
