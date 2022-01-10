// https://api.openweathermap.org/data/2.5/weather?q=Kazan&units=metric&appid=b98fb8dd2eba265a6706b69f9274e306

import UIKit

class ViewController: UIViewController {

	let imageBackgrond: UIImageView = {
		var image = UIImageView()
		image.image = UIImage(named: "background")
		image.frame = UIScreen.main.bounds
		image.backgroundColor = #colorLiteral(red: 0, green: 0.09214895219, blue: 0.0996741578, alpha: 1)
		image.contentMode = .scaleAspectFit
		image.isUserInteractionEnabled = true
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()
	
	let textField: UITextField = {
		let input = UITextField()
		input.frame = CGRect(x: 0, y: 0, width: 150, height: 45)
		input.backgroundColor = .white
		input.returnKeyType = .done
		input.autocapitalizationType = .words
		input.autocorrectionType = .no
		input.font = input.font?.withSize(15)
		input.translatesAutoresizingMaskIntoConstraints = false
		return input
	}()
	
	let text: UILabel = {
		let text = UILabel()
		text.frame = CGRect(x: 100, y: 200, width: 300, height: 50)
		text.text = "Enter your city"
		text.textColor = .white
		text.font = text.font.withSize(35)
		text.translatesAutoresizingMaskIntoConstraints = false
		return text
	}()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .black
		
		
		setContrainsts()
	}
		
}

extension ViewController{
	
	func	setContrainsts(){
		self.view.addSubview(self.text)
		
		self.view.addSubview(self.textField)
		self.textField.center = self.view.center
	}
}


