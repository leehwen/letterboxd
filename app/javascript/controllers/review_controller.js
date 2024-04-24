import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reviews"
export default class extends Controller {
  static targets = ["updatedReviewDate", "updatedReview", "updatedRating"]

  updateReview(e) {
    let rating = 0

    this.updatedRatingTargets.forEach((t) => {

      if (t.dataset.reviewId == e.target.dataset.reviewId && t.classList.contains('starred')) {
        rating += 1
      }
    })

    this.updatedReviewDateTargets.forEach((t1) => {
      this.updatedReviewTargets.forEach((t2) => {
        if (t1.dataset.reviewId == e.target.dataset.reviewId && t2.dataset.reviewId == e.target.dataset.reviewId) {
          fetch(`/films/${e.target.dataset.filmId}/reviews/${e.target.dataset.reviewId}`, {
            method: "PATCH",
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
              "X-CSRF-Token": this.#getMetaValue("csrf-token")
            },
            body: JSON.stringify({ date: t1.value, review: t2.value, rating: rating })
          })
          .then(response => response.json())
          .then((data) => {
            window.location.reload();
          })
        }
      })
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
