import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="flash-message"
export default class extends Controller {
  dismissFlashMessage() {
    this.element.remove();
  }
}
