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
		image.frame = CGRect(x: 5, y: 50, width: 70, height: 80)
//		image.translatesAutoresizingMaskIntoConstraints = false
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
		
		addSubview(weatherImage)
//		NSLayoutConstraint.activate([
//			weatherImage.leadingAnchor.constraint(equalTo: leadingAnchor),
//			weatherImage.trailingAnchor.constraint(equalTo: trailingAnchor),
//			weatherImage.topAnchor.constraint(equalTo: topAnchor),
//			weatherImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20),
//		])
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
