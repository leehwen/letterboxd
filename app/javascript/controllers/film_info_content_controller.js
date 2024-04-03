import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="film-info-content"
export default class extends Controller {
  static targets = ["content", "tab"]

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
}
