import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-films"
export default class extends Controller {

  static targets = ["content"]
  static values = {
    query: String
  }

  connect() {
    console.log('Connected');
    console.log(this.contentTarget.innerText)
    console.log(this.queryValue)

    const options = {
      method: 'GET',
      headers: {
        Accept: 'application/json',
        Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkODZhMzZiNjFhZDk2YzY2ZWY4ODU2ODI5ZTdiOWUyZiIsInN1YiI6IjY2MDhlYzkxMGQ0MTdlMDE3YzA3ZDM2NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.kbMLrF1Q09a2dJ3YDBhHV2768Bh5Zq5Mg3DI5w6h-LI'
      }
    };

    fetch(`https://api.themoviedb.org/3/search/movie?query=${this.queryValue}&include_adult=false&language=en-US&page=1`, options)
      .then(response => response.json())
      .then((data => {
        console.log(data);
      }))
      .catch(err => console.error(err));
  }
}
