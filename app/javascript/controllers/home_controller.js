import { Controller } from "@hotwired/stimulus";
import { toggle } from "el-transition";

// Connects to data-controller="home"
export default class extends Controller {
  static targets = ["mobileMenu"];

  toggleMobileMenu() {
    toggle(this.mobileMenuTarget);
  }
}
