import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  submitForm(e) {
    e.preventDefault()
    const form = e.target
    const action = form.action

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
      } else {
        throw new Error('Failed to update task');
      }
    })
  window.location.reload();
  }
}
