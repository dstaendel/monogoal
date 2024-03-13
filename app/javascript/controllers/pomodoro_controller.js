import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["display"]
  static values = {
    time: Number
  }

  connect() {
    console.log("Hello from Pomodoro 🍅");
    this.timeValue = (25 * 60)
    // this.timeValue = this.timeValue;
    this.#updateDisplay(this.timeValue);
    this.loadTime();
    if (window.location.pathname.includes('/')) {
      this.startDashboard()
      console.log("hello");
    }
  }

  start(event) {
    console.log("hello start");
    event.preventDefault();
    this.#countdown(this.timeValue);
    this.loadTime();
  }

  startDashboard() {
    this.#countdown(this.timeValue);
    this.loadTime();
  }

  stop(event) {
    event.preventDefault()
    console.log("Stopping timer ✋🏻");
    clearInterval(this.currentInterval)
  }

  reset(event) {
    event.preventDefault();
    // TODO Make Coundown go back to default time
    // link_to in HTML triggers a GET request and reloads the page
    // So no code needed here
    clearInterval(this.currentInterval);
    this.timeValue = (25 * 60)
    localStorage.setItem('pomodoroTime', this.timeValue.toString())
  }

  saveTime() {
    localStorage.setItem('pomodoroTime', this.timeValue.toString())
  }

  loadTime() {
    this.savedTime = localStorage.getItem('pomodoroTime');
    this.timeValue = this.savedTime ? parseInt(this.savedTime, 10) : (25 * 60)
    this.#updateDisplay(this.timeValue);
    console.log("updatedisplay on dash");
  }

  #countdown(duration) {
    let remainingTime = duration;

      this.currentInterval = setInterval(() => {
      remainingTime -= 1;
      this.saveTime();
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
