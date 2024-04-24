import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["newReview", "editReview"]


  connect() {
    // console.log('datepicker connected')
    if (this.hasNewReviewTarget) {
      flatpickr(this.newReviewTarget, { maxDate: "today", dateFormat: "Y-m-d", defaultDate: "today" })
    }

    this.editReviewTargets.forEach((t) => {
      flatpickr(t, { maxDate: "today", dateFormat: "Y-m-d", defaultDate: t.dataset.date })
    })
  }
}
