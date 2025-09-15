import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [ "switch", "content" ]

  connect() {
    this.contentTarget.classList.add('hidden')
  }

  toggle() {
    if (this.contentTarget.classList.contains('hidden'))
      this.contentTarget.classList.remove('hidden')
    else
      this.contentTarget.classList.add('hidden')
  }
}
