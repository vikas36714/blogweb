import { Component, OnInit } from '@angular/core';
import { CoreserviceService } from 'src/app/services/coreservice.service';

@Component({
  selector: 'app-our-core-services',
  templateUrl: './our-core-services.component.html',
  styleUrls: ['./our-core-services.component.css']
})
export class OurCoreServicesComponent implements OnInit {

  heading: string = 'Our Core Services';
  coreServicesData:any;
  error:any;

  constructor(private coreServices: CoreserviceService) { }

  ngOnInit(): void {
      this.coreServices.getCoreServices().subscribe(
        (res: any) => {
          this.coreServicesData = res.data
        },
         error => this.error = error
        );
  }

}
