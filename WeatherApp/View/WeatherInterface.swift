import UIKit

extension ViewWeather {
	
	func setWeatherInterface(){
		let clearSky = ["Clear", "Clear sky"]
		let clouds = ["Clouds", "Few clouds", "Scattered clouds", "Broken clouds"]
		let rains = ["Shower Rain", "Rain"]
		let thunderstorm = "Thunderstorm"
		let snow = "Snow"
		let mist = "Mist"
		
		guard let info = self.info else { print("SetWeatherInterface Error") ; return }
		
		backgroundImage.addBlur()
		
		if clearSky.contains(info.weather.first!.main) {
			backgroundImage.image = UIImage(named: "ClearSkyBackground")
			weatherImage.image = UIImage(named: "sun")
		} else if info.weather.first?.main == snow {
			backgroundImage.image = UIImage(named: "SnowBackground")
			weatherImage.image = UIImage(named: "snow")
		} else if rains.contains(info.weather.first!.main){
			backgroundImage.image = UIImage(named: "RainBackground")
			weatherImage.image = UIImage(named: "rain")
		} else if clouds.contains(info.weather.first!.main){
			backgroundImage.image = UIImage(named: "CloudsBackground")
			weatherImage.image = UIImage(named: "cloud")
		}
		
		weatherLabel.text = String(info.main.temp)
	}
}
