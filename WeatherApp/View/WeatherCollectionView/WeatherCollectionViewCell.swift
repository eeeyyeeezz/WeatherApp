// https://api.openweathermap.org/data/2.5/forecast?q=Moscow&units=metric&appid=b98fb8dd2eba265a6706b69f9274e306

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
	static let identifier: String = "WeatherCollectionViewCell"
	var completionHandler: ((ForecastStruct) -> ())?
	
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
			getForecastData()
			completionHandler = { newStruct in
//				self.nameLabel.text =
				

			}
			nameLabel.text = cityString
		}
	}
	
	let image: UIImageView = {
		let image = UIImageView()
		image.image = UIImage(named: "cloud")
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
//		if cityString == cityString { nameLabel.text = cityString } else { nameLabel.text = "Zhopa" }
//		nameLabel.text = "ASDDSA"
//		print(cityString)
		addSubview(nameLabel)
		NSLayoutConstraint.activate([
			nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: -25),
			nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5)
		])
		
		addSubview(image)
		NSLayoutConstraint.activate([
			image.leadingAnchor.constraint(equalTo: leadingAnchor),
			image.trailingAnchor.constraint(equalTo: trailingAnchor),
			image.topAnchor.constraint(equalTo: topAnchor),
			image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20)
		])
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
