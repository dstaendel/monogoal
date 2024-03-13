import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["confetti", "task", "inputSuccess", "inputUndone"]

  connect() {
    console.log("Shalom from confettiiiiii");
  }

  checkTaskCompletion(event) {
    event.preventDefault();

    console.log("SHALOOOOOOOOM");

    this.taskTargets.forEach((task) => {
      const first = this.inputUndoneTargets.length === 0;
      console.log("first", first);
      const second = this.inputSuccessTargets.length >= 1;
      console.log("second", first);
      this.checkedStuff = this.inputUndoneTargets.length === 0 && this.inputSuccessTargets.length >= 1
      console.log("checkedStuff", this.checkedStuff);

      if (this.checkedStuff) {
        this.startConfetti();
        console.log("starting confetti in checkTaskCompletion");
      }
    })
  }

  startConfetti() {
    console.log("🎉🎉🎉🎉🎉🎉");
    this.confettiTarget.classList.remove("d-none")
    setTimeout(() => {
      this.confettiTarget.classList.add("d-none")
    }, 10000);
  }
}
