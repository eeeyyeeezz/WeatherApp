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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBlue
		
		setContrainsts()
	}
		
}

extension ViewController{
	
	func	setContrainsts(){
		self.view.addSubview(self.imageBackgrond)
		
		
	}
}
