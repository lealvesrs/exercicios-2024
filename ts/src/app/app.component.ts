import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'Análise sensorial de preparações funcionais desenvolvidas para escolares entre 09 e 15 anos, do município de Campinas/SP';
  comments = [{ id: 1, comment:1, subject: "Assunto da pergunta aparece aqui", content: "Comecinho da pergunta aparece aqui neste relato inscreve-se no campo da anáise da dimensão e impacto de processo formativo situado impacto de processo formativo processo", author: "Letícia Alves de Oliveira" }];

  click() {
    var element = document.getElementById("section_hidden");
    var form = document.getElementById("form");
    if (element != null && form != null) {
      element.style.display = "none";
      form.classList.remove("d-none")
    }
  }

  createTopic() {
    var subject = (<HTMLInputElement>document.getElementById("subject")).value;
    var content = (<HTMLInputElement>document.getElementById("content")).value;
    if(content!="" && subject!=""){
      this.comments.push({
        id: 2,
        comment:0,
        subject: subject,
        content: content,
        author: "Letícia Alves de Oliveira"
      })
    }
  }
}
