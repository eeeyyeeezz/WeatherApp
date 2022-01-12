import Foundation

struct ForecastStruct: Decodable {
    let cod: String
    let message, cnt: Int
    let list: [List]
    let city: City
}

struct City: Decodable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

struct Coord: Decodable {
    let lat, lon: Double
}

struct List: Decodable {
    let dt: Int
    let main: MainClass
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let sys: Sys
    let dtTxt: String
    let snow: Snow?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
        case snow
    }
}

struct Clouds: Decodable {
    let all: Int
}

struct MainClass: Decodable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

struct Snow: Decodable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

struct Sys: Decodable {
    let pod: Pod
}

enum Pod: String, Decodable {
    case d = "d"
    case n = "n"
}

enum Icon: String, Codable {
    case the03D = "03d"
    case the04D = "04d"
    case the04N = "04n"
    case the13D = "13d"
    case the13N = "13n"
}

enum MainEnum: String, Codable {
    case clouds = "Clouds"
    case snow = "Snow"
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case lightSnow = "light snow"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
    case snow = "snow"
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}
