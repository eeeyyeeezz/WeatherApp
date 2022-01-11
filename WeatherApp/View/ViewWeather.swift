import UIKit

class ViewWeather: UIViewController {

	var cityString: String?
	
	var completionHandler: ((WeatherStruct) -> ())?
	
	var info: WeatherStruct?
	
	let imageBackgrond: UIImageView = {
		var image = UIImageView()
		image.image = UIImage(named: "background")
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()
	
	let cityLabel: UILabel = {
		let text = UILabel()
		text.textColor = .white
		text.font = text.font.withSize(70)
		text.translatesAutoresizingMaskIntoConstraints = false
		return text
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		getData()
		completionHandler = { newStruct in
			self.info = newStruct
			guard let _ = self.info?.name else { print("City Not Found!") ; return }
			self.setConstraints()
		}
	}
    
}

extension ViewWeather{
	
	func setConstraints(){
		DispatchQueue.main.async {
			guard let cityString = self.cityString else { print("CityString error") ; return }
			self.cityLabel.text = cityString
			self.view.addSubview(self.cityLabel)
			NSLayoutConstraint.activate([
				self.cityLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70),
				self.cityLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
			])
			
		}
		
		
	}
	
}
