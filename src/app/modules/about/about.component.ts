import { Component, OnInit } from '@angular/core';
import { AboutService } from 'src/app/services/about.service';


@Component({
  selector: 'app-about',
  templateUrl: './about.component.html',
  styleUrls: ['./about.component.css']
})
export class AboutComponent implements OnInit {

  about:any;
  error:any;

  constructor(private aboutService: AboutService) { }
  parentMessage = "message from parent"

  ngOnInit() {
    this.aboutService.getPages().subscribe(
      (res: any) => {
      this.about = res.data;
    },
      error => this.error = error
    );
  }

}
