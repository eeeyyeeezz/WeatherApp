import UIKit

extension ViewWeather{
	
	func setConstraints(){
		guard let cityString = cityString else { print("CityString error") ; return }
		
		view.addSubview(backgroundImage)
		view.addSubview(backButton)
		
		cityLabel.text = cityString
		view.addSubview(cityLabel)
		NSLayoutConstraint.activate([
			cityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
			cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
		
		weatherImage.center = view.center
		view.addSubview(weatherImage)
		
		view.addSubview(weatherLabel)
		NSLayoutConstraint.activate([
			weatherLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 10),
			weatherLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//			weatherLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
	}
	
}
