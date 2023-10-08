import { Controller } from "@hotwired/stimulus";
import { toggle } from "el-transition";

// Connects to data-controller="header"
export default class extends Controller {
  static targets = ["profileDropdown", "mobileMenu"];

  toggleProfileDropdown() {
    toggle(this.profileDropdownTarget);
  }

  toggleMobileMenu() {
    toggle(this.mobileMenuTarget);
  }
}
