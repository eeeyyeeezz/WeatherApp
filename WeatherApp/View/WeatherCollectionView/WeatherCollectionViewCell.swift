import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
	static let identifier: String = "WeatherCollectionViewCell"
	
	let image: UIImageView = {
		let image = UIImageView()
		
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
