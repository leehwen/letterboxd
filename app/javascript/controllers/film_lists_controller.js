import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="film-lists"
export default class extends Controller {
  static targets = ["query", "results", "show", "clear", "filmList"]
  static values = {
    listId: String,
    apiToken: String
  }

  connect() {

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
      console.log(data)
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
    this.queryTarget.value = "";
    this.showTarget.classList.add('d-none');
    this.filmListTarget.insertAdjacentHTML("beforeend", e.target.innerHTML)
  }

  #getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}
