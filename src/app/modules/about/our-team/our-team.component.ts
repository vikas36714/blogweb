import { Component, OnInit, Input } from '@angular/core';
import { AboutService } from 'src/app/services/about.service';

@Component({
  selector: 'app-our-team',
  templateUrl: './our-team.component.html',
  styleUrls: ['./our-team.component.css']
})
export class OurTeamComponent implements OnInit {

  heading: string = 'Meet Our Team';
  ourTeams: any;

  constructor(private aboutusService: AboutService) { }

  ngOnInit(): void {
    this.aboutusService.getOurTeam().subscribe( res=> {
      this.ourTeams = res.data;
    });

  }

}
