import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="film-info"
export default class extends Controller {
  static targets = ["content", "list", "reviewDate", "review", "rating", "updatedReviewDate", "updatedReview", "updatedRating"]
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

  addReview() {
    let rating = 0

    this.ratingTargets.forEach((t) => {

      if (t.classList.contains('starred')) {
        rating += 1
      }
    })

    fetch(`/library/${this.filmIdValue}/films`, {
      method: "POST",
      headers: {
        "Accept": "application/json",
        "X-CSRF-Token": this.#getMetaValue("csrf-token")
      }
    })
    .then(response => response.json())
    .then((data) => {
      console.log(this.reviewDateTarget.value)
      const film_id = data.film.id

      fetch(`/films/${film_id}/reviews`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "X-CSRF-Token": this.#getMetaValue("csrf-token")
        },
        body: JSON.stringify({date: this.reviewDateTarget.value, review: this.reviewTarget.value, rating: rating})
      })
      .then(response => response.json())
      .then((data) => {
        window.location.reload();
      })
    })
  }

  addRating(e) {
    if (e.target.dataset.rating != 0) {
      e.target.classList.add("starred")
    }

    this.ratingTargets.forEach ((t) => {
      if (t.dataset.rating <= e.target.dataset.rating && t.dataset.rating != 0) {
        t.classList.add("starred")
      } else if (t.dataset.rating > e.target.dataset.rating) {
        t.classList.remove("starred")
      }
    })
  }

  updateReview(e) {
    let rating = 0

    this.updatedRatingTargets.forEach((t) => {

      if (t.classList.contains('starred')) {
        rating += 1
      }
    })

    fetch(`/films/${e.target.dataset.filmId}/reviews/${e.target.dataset.reviewId}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-Token": this.#getMetaValue("csrf-token")
      },
      body: JSON.stringify({ date: this.updatedReviewDateTarget.value, review: this.updatedReviewTarget.value, rating: rating })
    })
    .then(response => response.json())
    .then((data) => {
      window.location.reload();
    })
  }

  updateRating(e) {
    if (e.target.dataset.rating != 0) {
      e.target.classList.add("starred")
    }

    this.updatedRatingTargets.forEach ((t) => {
      if (t.dataset.rating <= e.target.dataset.rating && t.dataset.rating != 0) {
        t.classList.add("starred")
      } else if (t.dataset.rating > e.target.dataset.rating) {
        t.classList.remove("starred")
      }
    })
  }

  #getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}
