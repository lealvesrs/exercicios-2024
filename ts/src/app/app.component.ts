import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'Análise sensorial de preparações funcionais desenvolvidas para escolares entre 09 e 15 anos, do município de Campinas/SP';

  click(){
    var element = document.getElementById("section_hidden");
    var form = document.getElementById("form");
    if(element!=null && form!=null){
      element.style.display = "none";
      form.classList.remove("d-none")
    }
  }

  createTopic(){

  }
}
