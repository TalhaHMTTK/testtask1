import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weather"
export default class extends Controller {
  static targets = ["output"]
  connect() {
    console.log("weather controller connected")
  }

  async fetchWeather(){
    try {
      const response = await fetch("https://api.open-meteo.com/v1/forecast?latitude=35&longitude=139&current_weather=true")
      const data = await response.json()

      const weather = data.current_weather

      this.outputTarget.innerHTML = `
      <p>Temperature = ${weather.temperature}</p>
      <p>Wind Speed = ${weather.windspeed}</p>
      <p>Time = ${weather.time}</p>
    `
    

    }
    catch (error){
      this.outputTarget.innerHTML = `<p>Error fetching weather data.</p>`
      console.error("Fetch error:", error)
    }
  }
}
