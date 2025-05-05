import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets=["menu"]
  connect() {
    console.log("Dropdown controller connected!")
  }

  toggle(){
    console.log("Dropdown toggle connected!")
    this.menuTarget.classList.toggle("d-none")
  }
}
