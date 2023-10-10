import { Controller } from "@hotwired/stimulus";
import { toggle } from "el-transition";

// Connects to data-controller="lead"
export default class extends Controller {
  static targets = ["filterByOptions"];

  toggleFilterByOptions() {
    toggle(this.filterByOptionsTarget);
  }
}
