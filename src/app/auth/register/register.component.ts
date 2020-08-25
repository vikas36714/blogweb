import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

// import custom validator to validate that password and confirm password fields match
import { MustMatch } from '../helpers/must-match.validator';
import { AuthService } from '../auth.service';
import { IUser } from 'src/app/interfaces/user';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  registerForm: FormGroup;
  submitted: boolean = false;
  success: boolean = false;
  error: any;

  constructor(private fb: FormBuilder, private authService: AuthService) { }

  ngOnInit(): void {
    this.registerForm = this.fb.group({
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]],
      confirmPassword: ['', Validators.required],
      acceptTerms: [false, Validators.requiredTrue]
    },{
      validator: MustMatch('password', 'confirmPassword')
    });
  }
   
  // convenience getter for easy access to form fields
  get form_controls() { return this.registerForm.controls; }

  register(){
    this.submitted = true;
    // stop here if form is invalid
    if (this.registerForm.invalid) {
        return;
    }
    this.authService.register(this.registerForm.value).subscribe((res:IUser[]) => {
      this.submitted = false;
      this.success = true;
      this.registerForm.reset();
    },
    error => this.error = error
    );
  }



}
