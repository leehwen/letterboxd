import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="film-info-content"
export default class extends Controller {
  static targets = ["content", "tab", "icon", "rating"]
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

      if (e.target.dataset.tab === t.dataset.content) {
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

    this.iconTargets.forEach((t1) => {
      if (e.target.dataset.icon === t1.dataset.icon) {
        t1.classList.toggle("d-none")

        if (e.target.dataset.icon === "watch" && e.target.dataset.status === "inactive") {
          this.iconTargets.forEach((t2) => {
            if (e.target.dataset.icon === "watch" && e.target.dataset.status === "active") {
              e.classList.toggle("d-none")
            } else if (t2.dataset.icon === "watchlist" && t2.dataset.status === "active") {
              t2.classList.add(`d-none`)

              this.iconTargets.forEach((t3) => {
                if (t3.dataset.icon === "watchlist" && t3.dataset.status === "inactive") {
                  t3.classList.remove(`d-none`)
                }
              })
            }
          })
        }
      }
    })
  }

  rate(e) {
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

      fetch (`/library/${this.libraryIdValue}/films/${film_id}`, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "X-CSRF-Token": this.#getMetaValue("csrf-token")
        },
        body: JSON.stringify({ update_type: e.target.dataset.icon, rating: e.target.dataset.rating })
      })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
    })

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

  #getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}
