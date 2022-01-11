import UIKit

extension ViewWeather {
	
	func setWeatherInterface(){
		guard let info = self.info else { print("SetWeatherInterface Error") ; return }
		
		backgroundImage.image = UIImage(named: "SnowBackground")
		
		if info.main.temp < 0 {
			backgroundImage.image = UIImage(named: "SnowBackground")
			weatherImage.image = UIImage(named: "snow")
		} else {
			backgroundImage.image = UIImage(named: "SunBackground")
			weatherImage.image = UIImage(named: "sun")
		}
		
		weatherLabel.text = "\(info.main.temp))"
	}
}
