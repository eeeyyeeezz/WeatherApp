import UIKit

extension WeatherCollectionViewCell {
	
	func setInterface(){
		getForecastData()
		completionHandler = { newStruct in
			DispatchQueue.main.async {
				self.forecstStruct = newStruct
				guard let idCell = self.idCell else { print("IdCell Error") ; return }
				let temp = "\(newStruct.list[idCell * 4].main.temp) °C"
				let dtTxt = newStruct.list[idCell * 4].dtTxt
				let time = dtTxt.dropFirst(11).dropLast(3)
				let date = "\(dtTxt[dtTxt.index(dtTxt.startIndex, offsetBy: 5)])" + "\(dtTxt[dtTxt.index(dtTxt.startIndex, offsetBy: 6)])" + "." + "\(dtTxt[dtTxt.index(dtTxt.startIndex, offsetBy: 8)])" + "\(dtTxt[dtTxt.index(dtTxt.startIndex, offsetBy: 9)])"
				self.nameLabel.text = date + "\n" + time + "\n" + temp
				self.setImage()
			}
		}
		nameLabel.text = cityString
	}
	
	func setImage(){
		let clearSky = ["Clear", "Clear sky"]
		let clouds = ["Clouds", "Few clouds", "Scattered clouds", "Broken clouds"]
		let rains = ["Rain", "Shower Rain"]
		let thunderstorm = "Thunderstorm"
		let snow = "Snow"
		let mist = "Mist"
		
		
		guard let idCell = idCell else { print("Id Cell error in setImage") ; return }
		guard let forecastStruct = self.forecstStruct else { print("SetForecastError Error") ; return }
		guard let weather = forecastStruct.list[idCell * 4].weather.first?.main else { print("SetForecastInterface Error") ; return }
		
		if clearSky.contains(weather) {
			
			weatherImage.image = UIImage(named: "sun")
		} else if weather == snow {
			
			weatherImage.image = UIImage(named: "snow")
		} else if rains.contains(weather){
			
			weatherImage.image = UIImage(named: "rain")
		} else if clouds.contains(weather){
			
			weatherImage.image = UIImage(named: "cloud")
		} else if weather == thunderstorm {
			
			weatherImage.image = UIImage(named: "thunderstorm")
		} else if weather == mist {
			
			weatherImage.image = UIImage(named: "mist")
		}
		
	}
	
}
