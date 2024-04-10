import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="film-info"
export default class extends Controller {
  static targets = ["content", "list"]
  static values = {
    apiToken: String,
    filmId: String,
    tmdbId: String
  }

  connect() {
    console.log('Connected')

    const filmInfo = {
      method: 'GET',
      headers: {
        Accept: 'application/json',
        Authorization: `Bearer ${this.apiTokenValue}`
      }
    };

    fetch(`https://api.themoviedb.org/3/movie/${this.tmdbIdValue}?append_to_response=credits&language=en-US`, filmInfo)
      .then(response => response.json())
      .then((data) => {
        const additionalFilmInfo = JSON.stringify({genres: data.genres, runtime: data.runtime, crew: data.credits.crew, cast: data.credits.cast});

        fetch(`/library/${this.filmIdValue}`, {
          method: "PATCH",
          headers: {
            "Content-Type": "application/json",
            "Accept": "text/plain",
            "X-CSRF-Token": this.#getMetaValue("csrf-token")
          },
          body: additionalFilmInfo
        })
        .then(response => response.text())
        .then((filmInfoHTML) => {
          this.contentTarget.innerHTML = filmInfoHTML
        })
      })
      .catch(err => console.error(err));
  }

  addToList() {
    console.log('clicked')
    this.listTargets.forEach((t) => {
      if (t.checked) {
        fetch(`/lists/${t.dataset.listId}/film_lists`, {
          method: "POST",
          headers: {
          "Content-Type": "application/json",
          "Accept": "text/plain",
          "X-CSRF-Token": this.#getMetaValue("csrf-token")
          },
            body: JSON.stringify({film_library_id: this.filmIdValue})
          })
          .then(response => response.text())
          .then((data) => {
            window.location.reload();
          })
      }
    })
  }

  #getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}
