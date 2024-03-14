import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "confetti", "task", "input", "image"]
  static values = { progress: Number }


  submitForm(event) {
    event.preventDefault()
    if (event.currentTarget.classList.contains("inputSuccess")) {
      event.currentTarget.classList.remove("inputSuccess")
      event.currentTarget.classList.add("inputUndone")
    } else {
      event.currentTarget.classList.remove("inputUndone")
      event.currentTarget.classList.add("inputSuccess")
    }

    const form = event.currentTarget.parentElement
    const action = form.action
    this.checkTaskCompletion();
    fetch(action, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: new URLSearchParams(new FormData(form)).toString()
    })
    .then(response => response.json())
    .then(data => {
      this.imageTarget.innerHTML = data.partial;
    })
  }
  checkTaskCompletion() {
    const allChecked = this.inputTargets.every((input) => input.classList.contains("inputSuccess"))
    if (allChecked) {
      this.startConfetti()
    }
  }

  startConfetti() {
    this.confettiTarget.classList.remove("d-none")
    setTimeout(() => {
      this.confettiTarget.classList.add("d-none")
    }, 10000);
  }
}
