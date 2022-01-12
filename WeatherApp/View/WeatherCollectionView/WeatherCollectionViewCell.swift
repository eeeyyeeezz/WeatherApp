// https://api.openweathermap.org/data/2.5/forecast?q=Moscow&units=metric&appid=b98fb8dd2eba265a6706b69f9274e306

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
	static let identifier: String = "WeatherCollectionViewCell"
	
	let image: UIImageView = {
		let image = UIImageView()
		image.backgroundColor = .red
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(image)
		NSLayoutConstraint.activate([
			image.leadingAnchor.constraint(equalTo: leadingAnchor),
			image.trailingAnchor.constraint(equalTo: trailingAnchor),
			image.topAnchor.constraint(equalTo: topAnchor),
			image.bottomAnchor.constraint(equalTo: bottomAnchor)
		
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
