import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="also-root-word"
export default class extends Controller {
  static targets = [ "samePage" ];

  connect() {
    this.firstInteraction = false
  }

  checkSamePage(e) {
    console.log(e.target.checked)
    if (e.target.checked && !this.firstInteraction) {
      this.samePageTarget.checked = true
      this.firstInteraction = true
    }
  }
}
