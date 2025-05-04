import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="counter"
export default class extends Controller {
  static targets = ["output"]

  connect() {
    this.count = 0
    this.update()
  }

  increment(){
    this.count++
    this.update()
  }

  decrement(){
    this.count--
    this.update()
  }

  update(){
    this.outputTarget.textContent = this.count
  }
}
