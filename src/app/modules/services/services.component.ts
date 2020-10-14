import { Component, OnInit } from '@angular/core';
import { CoreserviceService } from 'src/app/services/coreservice.service';

@Component({
  selector: 'app-services',
  templateUrl: './services.component.html',
  styleUrls: ['./services.component.css']
})
export class ServicesComponent implements OnInit {

  service: any;
  error: any;
  constructor(private coreServices: CoreserviceService) { }

  ngOnInit(): void {
    this.coreServices.getService().subscribe(
      (res: any) => {
        this.service = res.data
      },
       error => this.error = error
      );
  }

}
