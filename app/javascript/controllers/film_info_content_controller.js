import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="film-info-content"
export default class extends Controller {
  static targets = ["content", "tab", "icon"]
  static values = {
    libraryId: String,
  }

  select(e) {
    this.tabTargets.forEach((t) => {
      t.classList.remove("active")
    })

    e.target.classList.add("active")

    this.contentTargets.forEach((t) => {
      t.classList.add("d-none")

      if (e.target.dataset.tab == t.dataset.content) {
        t.classList.remove("d-none")
      }
    })
  }

  tracker(e) {
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

    this.iconTargets.forEach((t) => {
      if (t.dataset.icon == e.target.dataset.icon) {
        t.classList.toggle("d-none")
      }
    })
  }

  #getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}
