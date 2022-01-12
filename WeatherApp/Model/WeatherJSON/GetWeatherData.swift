import Foundation

extension ViewWeather{
	
	func getWeatherData(){
		guard var cityString = cityString else { print("CityString Error While GetData") ; return }
		cityString = cityString.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
		let urlString: String = "https://api.openweathermap.org/data/2.5/weather?q=" + cityString + "&units=metric&appid=b98fb8dd2eba265a6706b69f9274e306"
		guard let url = URL(string: urlString) else { print("Url Error!") ; return }
		
		let session = URLSession.shared.dataTask(with: url) { data, response, error in
			if let error = error { print(error) ; return }
			guard let data = data else { print("Data error!") ; return }

			do {
				let WeatherJSON = try JSONDecoder().decode(WeatherStruct.self, from: data)
				self.completionHandler?(WeatherJSON, true)
			} catch { print(error) ; self.completionHandler?(nil, false) }
			
		}
		
		session.resume()
	}
		
}
