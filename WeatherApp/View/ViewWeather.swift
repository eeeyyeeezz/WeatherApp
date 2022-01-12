import UIKit

class ViewWeather: UIViewController {

	var cityString: String?
	var completionHandler: ((WeatherStruct?, Bool) -> ())?
	var info: WeatherStruct?
	var weatherCV = WeatherCollectionView()
	
	let backgroundImage: UIImageView = {
		let image = UIImageView()
		image.frame = UIScreen.main.bounds
		image.backgroundColor = .black
		image.contentMode = .scaleAspectFill
		image.isUserInteractionEnabled = true
		return image
	}()
	
	let backButton: UIButton = {
		let button = UIButton()
		button.frame = CGRect(x: 20, y: 50, width: 30, height: 30)
		button.setBackgroundImage(UIImage(named: "BackArrow"), for: .normal)
		button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
		
		return button
	}()
	
	let cityLabel: UILabel = {
		let text = UILabel()
		text.textColor = .black
		text.font = text.font.withSize(50)
		text.translatesAutoresizingMaskIntoConstraints = false
		return text
	}()
	
	let weatherLabel: UILabel = {
		let text = UILabel()
		text.textColor = .black
		text.font = UIFont(name: "Helvetica", size: 45)
		text.translatesAutoresizingMaskIntoConstraints = false
		return text
	}()
	
	let tempLabel: UILabel = {
		let text = UILabel()
		text.textColor = .black
		text.font = UIFont(name: "Helvetica", size: 40)
		text.translatesAutoresizingMaskIntoConstraints = false
		return text
	}()
	
	let weatherImage: UIImageView = {
		let image = UIImageView()
		image.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
		return image
	}()
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		getWeatherData()
		completionHandler = { newStruct, cityExist in
			if cityExist{
				DispatchQueue.main.async {
					self.info = newStruct
					self.setWeatherInterface()
					self.setConstraints()
				}
			} else { self.setCityNotExist() }
		}
	}
	
    @objc func backButtonTapped(){ navigationController?.popViewController(animated: true) }

}
