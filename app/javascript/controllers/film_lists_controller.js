import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="film-lists"
export default class extends Controller {
  static targets = ["query", "results", "show", "clear", "filmList", "delete"]
  static values = {
    listId: String,
    filmId: String,
    apiToken: String
  }

  connect() {
    if (this.filmIdValue != "") {
      fetch(`/lists/${this.listIdValue}/film_lists`, {
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
          this.filmListTarget.innerHTML = data;
        })
    }
  }

  search(e) {
    e.preventDefault();

    const searchQuery = {
      method: 'GET',
      headers: {
        Accept: 'application/json',
        Authorization: `Bearer ${this.apiTokenValue}`
      }
    };

    fetch(`https://api.themoviedb.org/3/search/movie?query=${this.queryTarget.value}&include_adult=false&language=en-US&page=1`, searchQuery)
    .then(response => response.json())
    .then((data => {
      const searchResults = JSON.stringify({results: data.results, query: this.queryTarget.value});

      fetch(`/lists/${this.listIdValue}/film_lists/results`, {
      method: "POST",
      headers: {
      "Content-Type": "application/json",
      "Accept": "text/plain",
      "X-CSRF-Token": this.#getMetaValue("csrf-token")
      },
        body: searchResults
      })
      .then(response => response.text())
      .then((results => {
        this.showTarget.classList.remove('d-none');
        this.resultsTarget.innerHTML = results;
      }))
    }))
    .catch(err => console.error(err));
  }

  clear() {
    this.queryTarget.value = "";
    this.showTarget.classList.add('d-none');
  }

  addFilm(e) {
    fetch(`/lists/${this.listIdValue}/film_lists`, {
      method: "POST",
      headers: {
      "Content-Type": "application/json",
      "Accept": "text/plain",
      "X-CSRF-Token": this.#getMetaValue("csrf-token")
      },
        body: JSON.stringify({tmdb_id: e.target.dataset.filmId})
      })
      .then(response => response.text())
      .then((data) => {
        this.queryTarget.value = "";
        this.showTarget.classList.add('d-none');

        if (this.filmListTarget.innerHTML.includes('Your list is empty')) {
          this.filmListTarget.innerHTML = data;
        } else {
          this.filmListTarget.insertAdjacentHTML("beforeend", data)
        }
      })
  }

  deleteFilm(e) {
    console.log(e.target.dataset.listId)
    fetch(`/lists/${this.listIdValue}/film_lists/${e.target.dataset.listId}`, {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-Token": this.#getMetaValue("csrf-token")
        },
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data)

      this.deleteTargets.forEach((t) => {
        if (t.dataset.listId == e.target.dataset.listId) {
          t.outerHTML = "";
        }

        if (this.filmListTarget.innerHTML.length <= 1) {
          this.filmListTarget.innerHTML = `
          <div class="film list-empty">
            <h3>
              Your list is empty
            </h3>
            <p class="m-0">
              Add films using the field above.
            </p>
          </div>`
        }
      })
    })
  }

  #getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}
