// https://api.openweathermap.org/data/2.5/weather?q=Kazan&units=metric&appid=b98fb8dd2eba265a6706b69f9274e306

import UIKit

class ViewController: UIViewController {

	var completionHandler: ((String) -> ())?
	
	
	
	let textField: UITextField = {
		let input = UITextField()
		input.backgroundColor = .white
		input.returnKeyType = .done
		input.autocapitalizationType = .words
		input.autocorrectionType = .no
		input.font = UIFont(name: "Helvetica", size: 30)
		input.translatesAutoresizingMaskIntoConstraints = false
		return input
	}()
	
	let label: UILabel = {
		let text = UILabel()
		text.text = "Enter your city"
		text.textColor = .white
		text.font = UIFont(name: "Helvetica", size: 35)
		text.translatesAutoresizingMaskIntoConstraints = false
		return text
	}()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .black
		navigationController?.navigationBar.isHidden = true
		
		let vw = ViewWeather()
		vw.cityString = "Kazan"
		navigationController?.pushViewController(vw, animated: true)
//		setContrainsts()
	}
		
}

extension ViewController : UITextFieldDelegate{
	
	func	setContrainsts(){
		view.addSubview(textField)
		textField.delegate = self
		NSLayoutConstraint.activate([
			textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			textField.widthAnchor.constraint(equalToConstant: 230),
			textField.heightAnchor.constraint(equalToConstant: 50)
		])
		
		view.addSubview(label)
		NSLayoutConstraint.activate([
			label.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -70),
			label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			label.widthAnchor.constraint(equalToConstant: 230),
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
		}
		return true
	}
}


