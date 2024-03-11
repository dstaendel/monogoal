import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["taskItem", "scrollContainer"];

  initialize() {
    this.currentIndex = 0;
    this.pageSize = 5; // Number of items to load each time
    this.loading = false; // Prevent multiple loads at the same time
    this.loadMore(); // Initially load tasks
  }

  connect() {
    this.scrollContainerTarget.addEventListener('scroll', () => this.checkScroll());
  }

  disconnect() {
    this.scrollContainerTarget.removeEventListener('scroll', () => this.checkScroll());
  }

  loadMore() {
    if (this.loading) return;
    this.loading = true;

    const startIndex = this.currentIndex * this.pageSize;
    const endIndex = startIndex + this.pageSize;
    const itemsToShow = this.taskItemTargets.slice(startIndex, endIndex);

    itemsToShow.forEach(task => task.style.display = 'block');

    if (itemsToShow.length === 0 || itemsToShow.length < this.pageSize) {
      // Optionally handle the end of the list (e.g., hide the scroll container or show a message)
    } else {
      this.currentIndex++; // Prepare for the next load
    }

    this.loading = false;
  }

  checkScroll() {
    const { scrollTop, scrollHeight, clientHeight } = this.scrollContainerTarget;
    if (scrollTop + clientHeight >= scrollHeight - 100) { // 100px before reaching the bottom
      this.loadMore();
    }
  }
}
