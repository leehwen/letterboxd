import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-films"
export default class extends Controller {

  static targets = ["content"]
  static values = {
    query: String,
    apiToken: String
  }

  connect() {
    console.log('Connected');

    const searchQuery = {
      method: 'GET',
      headers: {
        Accept: 'application/json',
        Authorization: `Bearer ${this.apiTokenValue}`
      }
    };

    fetch(`https://api.themoviedb.org/3/search/movie?query=${this.queryValue}&include_adult=false&language=en-US&page=1`, searchQuery)
      .then(response => response.json())
      .then((data => {
        const searchResults = JSON.stringify({results: data.results, query: this.queryValue});

        fetch(`/library/results`, {
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
          this.contentTarget.innerHTML = results;
        }))
      }))
      .catch(err => console.error(err));
  }
param
  #getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}
