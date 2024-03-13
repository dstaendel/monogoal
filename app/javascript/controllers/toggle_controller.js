import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "confetti", "task", "input"]

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

    // event.currentTarget.value =


    this.checkTaskCompletion();

    fetch(action, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: new URLSearchParams(new FormData(form)).toString()
    })
    .then(response => {
      if (response.ok) {
        console.log('Task updated successfully');
      }
    })
  }

  checkTaskCompletion() {
    let statement = null
    this.inputTargets.forEach((input) => {
      if (input.classList.contains("inputUndone")) {
        statement = false
        return
      } else if (input.classList.contains("inputSuccess")){
        statement = true
      }
    })

    console.log(statement);

    if (statement) {
      this.startConfetti()
    }
  }

  startConfetti() {
    console.log("🎉🎉🎉🎉🎉🎉");
    this.confettiTarget.classList.remove("d-none")
    setTimeout(() => {
      this.confettiTarget.classList.add("d-none")
    }, 10000);
  }
}
