import Foundation

extension ViewWeather{
	
	func getData(){
		guard let cityString = cityString else { print("CityString Error While GetData") ; return }
		let urlString: String = "https://api.openweathermap.org/data/2.5/weather?q=" + cityString + "&units=metric&appid=b98fb8dd2eba265a6706b69f9274e306"
		guard let url = URL(string: urlString) else { return }
		
		let session = URLSession.shared.dataTask(with: url) { data, response, error in
			if let error = error { print(error) ; return }
            guard let data = data else { print("Data error!") ; return }
			
//			let JSONString = String(data: data, encoding: .utf8)
//			print(JSONString)
			do {
				let WeatherJSON = try JSONDecoder().decode(WeatherStruct.self, from: data)
				self.completionHandler?(WeatherJSON)
			} catch { print(error) }
			
		}
		
		session.resume()
	}
		
}
