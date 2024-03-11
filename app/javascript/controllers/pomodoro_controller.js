import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["display"]
  static values = {
    time: Number
  }

  connect() {
    console.log("Hello from Pomodoro 🍅");
    this.timeValue = (25 * 60)
    this.#updateDisplay(this.timeValue);
  }

  start(event) {
    event.preventDefault();
    this.#countdown(this.timeValue)
  }

  stop(event) {
    event.preventDefault()
    console.log("Stopping timer ✋🏻");
    // TODO Make countdown stop
    clearInterval(this.currentInterval)
  }

  reset() {
    // TODO Make Coundown go back to default time
    // link_to in HTML triggers a GET request and reloads the page
    // So no code needed here
  }

  #countdown(duration) {
    let remainingTime = duration;

      this.currentInterval = setInterval(() => {
      remainingTime -= 1;
      this.timeValue = remainingTime;

      this.#updateDisplay(remainingTime);
      if (remainingTime <= 0) {
        clearInterval(this.currentInterval);
      }
    }, 1000)
  }

  #updateDisplay(remainingTime) {
    this.displayTarget.innerHTML = `<p>${this.#formatTime(remainingTime)}</p>`;
    console.log("Timer is now running 🐌");
  }

  #formatTime(seconds) {
    const minutes = Math.floor(seconds / 60);
    const remainingSeconds = seconds % 60;
    return `${minutes}:${remainingSeconds < 10 ? '0' : ''}${remainingSeconds}`;
  }
}
