// https://api.openweathermap.org/data/2.5/weather?q=Kazan&units=metric&appid=b98fb8dd2eba265a6706b69f9274e306

import UIKit

class ViewController: UIViewController {

	var completionHandler: ((String) -> ())?
	
	let cloudsBackground: UIImageView = {
		let image = UIImageView()
		image.image = UIImage(named: "CloudsWallpaper")
		image.frame = UIScreen.main.bounds
		image.backgroundColor = .black
		image.contentMode = .scaleAspectFill
		image.isUserInteractionEnabled = true
		return image
	}()
	
	let textField: UITextField = {
		let input = UITextField()
		input.backgroundColor = #colorLiteral(red: 0.904774487, green: 0.9100334048, blue: 0.9097648263, alpha: 1)
		input.returnKeyType = .done
		input.autocapitalizationType = .words
		input.autocorrectionType = .no
		input.font = UIFont(name: "Helvetica", size: 40)
		input.translatesAutoresizingMaskIntoConstraints = false
		return input
	}()
	
	let label: UILabel = {
		let text = UILabel()
		text.text = "Enter your city"
		text.textColor = .white
		text.font = UIFont(name: "Helvetica", size: 40)
		text.translatesAutoresizingMaskIntoConstraints = false
		return text
	}()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .black
		navigationController?.navigationBar.isHidden = true
		
//		let vw = ViewWeather()
//		vw.cityString = "Kazan"
//		navigationController?.pushViewController(vw, animated: true)
		setContrainsts()
	}
		
}

extension ViewController : UITextFieldDelegate{
	
	func	setContrainsts(){
		view.addSubview(cloudsBackground)
		view.addSubview(textField)
		textField.delegate = self
		NSLayoutConstraint.activate([
			textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			textField.widthAnchor.constraint(equalToConstant: 260),
			textField.heightAnchor.constraint(equalToConstant: 50)
		])
		
		view.addSubview(label)
		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
			label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			label.widthAnchor.constraint(equalToConstant: 260),
			label.heightAnchor.constraint(equalToConstant: 50)
		])
		
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		let vw = ViewWeather()
		textField.resignFirstResponder()
		if let text = textField.text {
			completionHandler?(text)
			vw.cityString = text
			navigationController?.pushViewController(vw, animated: true)
			textField.text = ""
		}
		return true
	}
}


