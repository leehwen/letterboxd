import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="watchlist"
export default class extends Controller {
  static targets = ["film", "icon"]

  static values = {
    libraryId: String,
  }

  tracker(e) {
    e.preventDefault();

    fetch(`/library/${this.libraryIdValue}/films`, {
      method: "POST",
      headers: {
        "Accept": "application/json",
        "X-CSRF-Token": this.#getMetaValue("csrf-token")
      }
    })
    .then(response => response.json())
    .then((data) => {
      const film_id = data.film.id

      fetch(`/library/${this.libraryIdValue}/films/${film_id}`, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "X-CSRF-Token": this.#getMetaValue("csrf-token")
        },
        body: JSON.stringify({ update_type: e.target.dataset.icon })
      })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
    })

    this.iconTargets.forEach((t1) => {
      if (e.target.dataset.icon == "like" && e.target.dataset.icon === t1.dataset.icon) {
        t1.classList.toggle("d-none")
      } else if (e.target.dataset.icon == "watch" && e.target.dataset.status == "inactive" && e.target.dataset.icon === t1.dataset.icon) {
        t1.classList.toggle("d-none")
        setTimeout(() => {this.filmTarget.classList.add("d-none")}, 800)
      } else if (e.target.dataset.icon == "watch" && e.target.dataset.status == "active" && e.target.dataset.icon === t1.dataset.icon) {
        t1.classList.toggle("d-none")
      }
    })
  }

  #getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}
