// https://api.openweathermap.org/data/2.5/weather?q=Kazan&units=metric&appid=b98fb8dd2eba265a6706b69f9274e306

import UIKit

class ViewController: UIViewController {

	let imageBackgrond: UIImageView = {
		var image = UIImageView()
		image.image = UIImage(named: "background")
		image.frame = UIScreen.main.bounds
		image.backgroundColor = .black
		image.contentMode = .scaleAspectFit
		image.isUserInteractionEnabled = true
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()
	
	let textField: 
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setContrainsts()
	}
		
}

extension ViewController{
	
	func	setContrainsts(){
		self.view.addSubview(self.imageBackgrond)
		self.imageBackgrond.addBlur()
		
	}
}
