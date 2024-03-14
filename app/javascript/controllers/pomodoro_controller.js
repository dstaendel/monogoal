import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["display"]
  static values = {
    remainingSeconds: Number,
    running: Boolean
  }

  connect() {
    if (this.remainingSecondsValue === 0) {
      this.remainingSecondsValue = 1500;
    }

    if (this.runningValue) {
      this.start();
    }

    this.#updateDisplay(this.remainingSecondsValue);
  }

  start(event) {
    event?.preventDefault();
    this.#countdown(this.remainingSecondsValue);
    this.runningValue = true;
  }

  stop(event) {
    event.preventDefault()
    clearInterval(this.currentInterval);
    this.runningValue = false;
  }

  reset(event) {
    event.preventDefault();
    clearInterval(this.currentInterval);
    this.remainingSecondsValue = (25 * 60);
    this.#updateDisplay(this.timeValue);
    this.runningValue = false;
  }

  #countdown(duration) {
    let remainingTime = duration;

      this.currentInterval = setInterval(() => {
      remainingTime -= 1;
      this.remainingSecondsValue = remainingTime;

      this.#updateDisplay();
      if (remainingTime <= 0) {
        clearInterval(this.currentInterval);
      }
    }, 1000);
  }

  #updateDisplay() {
    this.displayTarget.innerHTML = `<p>${this.#formatTime()}</p>`;
  }

  #formatTime() {
    const minutes = Math.floor(this.remainingSecondsValue / 60);
    const remainingSeconds = this.remainingSecondsValue % 60;
    return `${minutes}:${remainingSeconds < 10 ? '0' : ''}${remainingSeconds}`;
  }

  takeFive(event) {
    event.preventDefault()
    const searchQuery = `seconds=${this.remainingSecondsValue}&running=${this.runningValue}`
    const url = `${event.currentTarget.href}?${searchQuery}`
    window.location.href = url;
  }
}
