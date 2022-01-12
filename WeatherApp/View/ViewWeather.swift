import UIKit

class ViewWeather: UIViewController {

	var cityString: String?
	var completionHandler: ((WeatherStruct) -> ())?
	var info: WeatherStruct?
	
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
		text.font = UIFont(name: "Helvetica", size: 40)
		text.numberOfLines = 0
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
		
		getData()
		completionHandler = { newStruct in
			DispatchQueue.main.async {
				self.info = newStruct
				// City Not Found TODO
				
				self.setWeatherInterface()
				self.setConstraints()
			}
		}
	}
	
    @objc func backButtonTapped(){ navigationController?.popViewController(animated: true) }

}
