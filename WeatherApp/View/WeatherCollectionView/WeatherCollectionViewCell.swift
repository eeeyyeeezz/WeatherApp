// https://api.openweathermap.org/data/2.5/forecast?q=Moscow&units=metric&appid=b98fb8dd2eba265a6706b69f9274e306

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
	static let identifier: String = "WeatherCollectionViewCell"
	var completionHandler: ((ForecastStruct) -> ())?
	var forecstStruct: ForecastStruct?
	
	var idCell: Int? {
		didSet{
			guard let idCell = idCell else { return }
			self.idCell = idCell
		}
	}
	
	var cityString: String? {
		didSet{
			guard let cityString = cityString else { return }
			self.cityString = cityString
			setInterface()
		}
	}
	
	let weatherImage: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
		label.numberOfLines = 0
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(nameLabel)
		NSLayoutConstraint.activate([
			nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: -25),
			nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5)
		])
		
//		addSubview(weatherImage)
//		NSLayoutConstraint.activate([
//			weatherImage.leadingAnchor.constraint(equalTo: leadingAnchor),
//			weatherImage.trailingAnchor.constraint(equalTo: trailingAnchor),
//			weatherImage.topAnchor.constraint(equalTo: topAnchor),
//			weatherImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20)
//		])
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

extension WeatherCollectionViewCell {
	
	func setInterface(){
		getForecastData()
		completionHandler = { newStruct in
			DispatchQueue.main.async {
				self.forecstStruct = newStruct
				guard let idCell = self.idCell else { print("IdCell Error") ; return }
				print("ID CELL IS " + "\(idCell)")
				let temp = "\(newStruct.list[idCell + 4].main.temp) °C"
				let dtTxt = newStruct.list[idCell + 4].dtTxt
				let date = "\(dtTxt[dtTxt.index(dtTxt.startIndex, offsetBy: 5)])" + "\(dtTxt[dtTxt.index(dtTxt.startIndex, offsetBy: 6)])" + "." + "\(dtTxt[dtTxt.index(dtTxt.startIndex, offsetBy: 8)])" + "\(dtTxt[dtTxt.index(dtTxt.startIndex, offsetBy: 9)])"
				self.nameLabel.text = temp + "\n" + date
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
		
		guard let forecastStruct = self.forecstStruct else { print("SetForecastError Error") ; return }
		guard let weather = forecastStruct.list.first?.weather.first?.main else { print("SetForecastInterface Error") ; return }
		
		if clearSky.contains(weather) {
//			nameLabel.text = "Clear Sky"
			weatherImage.image = UIImage(named: "sun")
		} else if weather == snow {
//			nameLabel.text = "Snow"
			weatherImage.image = UIImage(named: "snow")
		} else if rains.contains(weather){
//			nameLabel.text = "Rain"
			weatherImage.image = UIImage(named: "rain")
		} else if clouds.contains(weather){
//			nameLabel.text = "Cloud"
			weatherImage.image = UIImage(named: "cloud")
		} else if weather == thunderstorm {
//			nameLabel.text = "Thunderstorm"
			weatherImage.image = UIImage(named: "thunderstorm")
		} else if weather == mist {
//			nameLabel.text = "Mist"
			weatherImage.image = UIImage(named: "mist")
		}
		
	}
	
}
