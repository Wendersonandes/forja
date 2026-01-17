import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-preview"
export default class extends Controller {
  static targets = ["submitbtn"]

  // hide the submit button
  connect() {
    this.submitbtnTarget.hidden = true
  }

  // click the hidden button -> submit the form
  remotesubmit() {
    this.submitbtnTarget.click()
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.submitbtnTarget.click()
    }, 500)
  }

  // same as above, but with "debounce"
  // remotesubmit() {

  // }
}
