import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { environment } from 'src/environments/environment';
import { NotificationService } from '../../notification.service';

@Component({
  selector: 'app-about',
  templateUrl: './about.component.html'
})
export class AboutComponent implements OnInit {

  private serverUrl = environment.baseUrl;
  pageTitle: string = "Edit About Page";
  editForm: FormGroup;
  submitted: boolean= false;
  success: boolean = false;
  message: string;
  uploadError: string;
  imagePath: string;
  error: any;

  constructor(private fb: FormBuilder, private router: Router,private route: ActivatedRoute ,private notifyService : NotificationService, private http: HttpClient) { }


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
      heading: ['', [Validators.required]],
      title: ['', [Validators.required]],
      image: [''],
      description: ['', [Validators.required]],
    });

       this.http.get<any>(this.serverUrl + 'editAbout').subscribe(res => {
        this.editForm.patchValue({
              id: res.data.id,
              title: res.data.title,
              heading: res.data.heading,
              description: res.data.description
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

    formData.append('heading', this.editForm.get('heading').value);
    formData.append('title', this.editForm.get('title').value);
    formData.append('image', this.editForm.get('image').value);
    formData.append('description', this.editForm.get('description').value);
    formData.append('id', this.editForm.get('id').value);

    this.http.post(this.serverUrl + 'updateAbout', formData).subscribe((res: any) => {
        this.router.navigate(['admin/about']).then(() => this.showToasterSuccess(res.message));
    },
    error => this.router.navigate(['admin/about']).then(() => this.showToasterError(error[0].message))
    );

  }

}
