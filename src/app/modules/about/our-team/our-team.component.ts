import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-our-team',
  templateUrl: './our-team.component.html',
  styleUrls: ['./our-team.component.css']
})
export class OurTeamComponent implements OnInit {

  @Input() childMessage: string;


  constructor() { }

  ngOnInit(): void {
    console.log(this.childMessage);
  }

}
