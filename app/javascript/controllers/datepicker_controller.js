import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["newReview", "editReview"]


  connect() {
    // console.log(this.editReviewTarget.dataset.date)
    flatpickr(this.newReviewTarget, { maxDate: "today", dateFormat: "Y-m-d", defaultDate: "today" })
    flatpickr(this.editReviewTarget, { maxDate: "today", dateFormat: "Y-m-d", defaultDate: this.editReviewTarget.dataset.date })
  }
}
