import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [ "switch", "content", "icon" ]

  connect() {
    // this.contentTarget.classList.add('hidden')
    if (this.contentTarget.classList.contains('hidden'))
      this.iconTarget.innerHTML = "&plus;"
    else
      this.iconTarget.innerHTML = "&minus;"
  }

  toggle() {
    if (this.contentTarget.classList.contains('hidden')) {
      this.iconTarget.innerHTML = "&minus;"
      this.contentTarget.classList.remove('hidden')
    } else {
      this.iconTarget.innerHTML = "&plus;"
      this.contentTarget.classList.add('hidden')
    }
  }
}
