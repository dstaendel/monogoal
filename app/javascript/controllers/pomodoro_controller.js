import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["display"]
  static values = {
    time: Number,
    defaultTime: Number
  }

  connect() {
    this.timeValue = this.defaultTimeValue || (25 * 60)
    console.log(this.displayTarget);
  }

  start() {
    console.log("starting timer");
    this.countdown(this.timeValue)
    // this.updateDisplay();
    // this.stop()
  }

  countdown(duration) {
    let remainingTime = duration;

    const timer = setInterval(() => {
      remainingTime -= 1;
      this.timeValue = remainingTime;
      this.updateDisplay();

      console.log("formated time", this.formatTime(remainingTime));
      if (remainingTime <= 0) {
        clearInterval(timer);
        console.log("Time's up!")
      }
    }, 1000)
  }

  stop() {
    console.log("stopping timer");
    // TODO Make countdown stop
  }

  reset() {
    // TODO Make Coundown go back to default time
  }

  formatTime(seconds) {
    const minutes = Math.floor(seconds / 60);
    const remainingSeconds = seconds % 60;
    return `${minutes}:${remainingSeconds < 10 ? '0' : ''}${remainingSeconds}`;
  }

  updateDisplay() {
    // TODO Display Timer in Display
    console.log("👻👻");
    this.changeText(this.formatTime(this.timeValue));
    console.log(this.displayTarget);
    // remainingTime
  }

  changeText(time) {
    this.displayTarget.innerHTML = `<p>${time}</p>`;
  }
}
