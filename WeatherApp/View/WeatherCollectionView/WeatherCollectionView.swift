import UIKit

class WeatherCollectionView: UICollectionView {
	
	init(){
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		super.init(frame: .zero, collectionViewLayout: layout)
		delegate = self
		dataSource = self
		backgroundColor = nil
		register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: WeatherCollectionViewCell.identifier)
		translatesAutoresizingMaskIntoConstraints = false
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}

extension WeatherCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 10 }
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.identifier, for: indexPath)
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 110, height: 120)
	}
}
