// app/javascript/controllers/pagination_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["taskItem", "backButton", "nextButton"];

  initialize() {
    this.currentIndex = 0;
    this.pageSize = 5;
    this.tasksCount = this.taskItemTargets.length;
    this.pageCount = Math.ceil(this.tasksCount / this.pageSize);
    this.toggleButtonStates();
    this.showPage(this.currentIndex);
  }

  showPage(pageIndex) {
    const start = pageIndex * this.pageSize;
    const end = start + this.pageSize;
    this.taskItemTargets.forEach((task, index) => {
      task.style.display = (index >= start && index < end) ? 'block' : 'none';
    });
  }

  next() {
    if (this.currentIndex < this.pageCount - 1) {
      this.currentIndex++;
      this.showPage(this.currentIndex);
      this.toggleButtonStates();
    }
  }

  back() {
    if (this.currentIndex > 0) {
      this.currentIndex--;
      this.showPage(this.currentIndex);
      this.toggleButtonStates();
    }
  }

  toggleButtonStates() {
    this.backButtonTarget.disabled = this.currentIndex === 0;
    this.nextButtonTarget.disabled = this.currentIndex === this.pageCount - 1;
  }
}
