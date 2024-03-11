import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["date"]

  connect() {
    console.log(this.dateTarget);
    // flatpickr(this.element)
    flatpickr(this.dateTarget, {
      mode: "range"
    });
  }
}
