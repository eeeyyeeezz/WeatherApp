import UIKit

extension ViewWeather {
	
	func setWeatherInterface(){
		let clearSky = ["Clear", "Clear sky"]
		let clouds = ["Clouds", "Few clouds", "Scattered clouds", "Broken clouds"]
		let rains = ["Rain", "Shower Rain"]
		let thunderstorm = "Thunderstorm"
		let snow = "Snow"
		let mist = "Mist"
		
		guard let info = self.info else { print("SetWeatherInterface Error") ; return }
		guard let weather = info.weather.first?.main else { print("SetWeatherInterface Error") ; return }
		
		backgroundImage.addBlur()
		if clearSky.contains(weather) {
			backgroundImage.image = UIImage(named: "ClearSkyBackground")
			weatherLabel.text = "Clear Sky"
			weatherImage.image = UIImage(named: "sun")
		} else if weather == snow {
			backgroundImage.image = UIImage(named: "SnowBackground")
			weatherLabel.text = "Snow"
			weatherImage.image = UIImage(named: "snow")
		} else if rains.contains(weather){
			backgroundImage.image = UIImage(named: "RainBackground")
			weatherLabel.text = "Rain"
			weatherImage.image = UIImage(named: "rain")
		} else if clouds.contains(weather){
			backgroundImage.image = UIImage(named: "CloudsBackground")
			weatherLabel.text = "Cloud"
			weatherImage.image = UIImage(named: "cloud")
		} else if weather == thunderstorm {
			backgroundImage.image = UIImage(named: "ThunderstormBackground")
			weatherLabel.text = "Thunderstorm"
			weatherImage.image = UIImage(named: "thunderstorm")
		} else if weather == mist {
			backgroundImage.image = UIImage(named: "MistBackground")
			weatherLabel.text = "Mist"
			weatherImage.image = UIImage(named: "mist")
		}
		
		tempLabel.text = String(info.main.temp) + " °C"
	}
	
	func setCityNotExist(){
		DispatchQueue.main.async {
			self.backgroundImage.image = UIImage(named: "NotFoundBackground")
			
			self.view.addSubview(self.backgroundImage)
			self.view.addSubview(self.backButton)
		}
	}
	
}
