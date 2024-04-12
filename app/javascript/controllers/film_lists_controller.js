import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="film-lists"
export default class extends Controller {
  static targets = ["query", "results", "show", "clear", "filmList", "film", "addNote","modal", "modalInput"]
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

      this.filmTargets.forEach((t) => {
        if (t.dataset.listId == e.target.dataset.listId) {
          t.outerHTML = "";
        }

        console.log(this.filmListTarget.innerHTML.length)
        if (this.filmListTarget.innerHTML.length <= 25) {
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

  addNote(e) {
    if (e.target.dataset.notes === undefined) {
      this.modalTarget.innerHTML = `
      <div class="modal-body" data-film-lists-target="modal">
      <div class="row">
        <div class="col-md-3 ps-md-4 col-sm-4 ps-sm-3">
          <div class="list-modal-img">
            <img src="${e.target.dataset.url}">
          </div>
        </div>
        <div class="col-md-9 px-md-4 col-sm-8 pe-sm-3">
          <p class="modal-title list-modal-title fs-5" id="exampleModalLabel">
            EDIT LIST ENTRY
          </p>
          <h3>
            ${e.target.dataset.filmTitle}
          </h3>
          <div class="list-modal-input">
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="6" placeholder="Add notes..." data-film-lists-target="modalInput" data-list-id="${e.target.dataset.listId}"></textarea>
          </div>
        </div>
      </div>
      </div>
      <div class="modal-footer list-modal-footer">
        <button type="button" class="btn btn-grey" data-bs-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-green" data-bs-dismiss="modal" data-action="click->film-lists#updateNote" data-list-id="${e.target.dataset.listId}" data-film-title="${e.target.dataset.filmTitle}" data-url="${e.target.dataset.url}">Update</button>
      </div>`
    } else {
      this.modalTarget.innerHTML = `
      <div class="modal-body" data-film-lists-target="modal">
      <div class="row">
        <div class="col-md-3 ps-md-4 col-sm-4 ps-sm-3">
          <div class="list-modal-img">
            <img src="${e.target.dataset.url}">
          </div>
        </div>
        <div class="col-md-9 px-md-4 col-sm-8 pe-sm-3">
          <p class="modal-title list-modal-title fs-5" id="exampleModalLabel">
            EDIT LIST ENTRY
          </p>
          <h3>
            ${e.target.dataset.filmTitle}
          </h3>
          <div class="list-modal-input">
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="6" placeholder="Add notes..." data-film-lists-target="modalInput" data-list-id="${e.target.dataset.listId}">${e.target.dataset.notes}</textarea>
          </div>
        </div>
      </div>
      </div>
      <div class="modal-footer list-modal-footer">
        <button type="button" class="btn btn-grey" data-bs-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-green" data-bs-dismiss="modal" data-action="click->film-lists#updateNote" data-list-id="${e.target.dataset.listId}" data-film-title="${e.target.dataset.filmTitle}" data-url="${e.target.dataset.url}">Update</button>
      </div>`
    }
  }

  updateNote(e) {
    fetch(`/lists/${this.listIdValue}/film_lists/${e.target.dataset.listId}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-Token": this.#getMetaValue("csrf-token")
        },
      body: JSON.stringify({notes: this.modalInputTarget.value})
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data)

      this.addNoteTargets.forEach((t) => {
        if (t.dataset.listId === e.target.dataset.listId) {
          if (this.modalInputTarget.value === "") {
            t.outerHTML = `
            <button type="button" class="btn btn-transparent-sm" data-action="click->film-lists#addNote" data-film-lists-target="addNote" data-list-id="${e.target.dataset.listId}" data-film-title="${e.target.dataset.filmTitle}" data-url="${e.target.dataset.url}" data-bs-toggle="modal" data-bs-target="#exampleModal">
            ADD NOTE
            </button>`
          } else {
            t.outerHTML = `
            <button type="button" class="btn btn-transparent-sm" data-action="click->film-lists#addNote" data-film-lists-target="addNote" data-list-id="${e.target.dataset.listId}" data-film-title="${e.target.dataset.filmTitle}" data-url="${e.target.dataset.url}" data-notes="${this.modalInputTarget.value}" data-bs-toggle="modal" data-bs-target="#exampleModal">
            EDIT NOTE
            </button>`
          }
        }
      })
    })
  }

  #getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}
