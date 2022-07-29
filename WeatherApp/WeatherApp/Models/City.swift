//
//  City.swift
//  WeatherApp
//
//  Created by Tarek El Ghoul on 28/07/2022.
//

import Foundation
import WeatherService

struct City {
    
    var name: String
    var longitude: Double
    var latitude: Double
    var cityWeather: WeatherData?
    
    var conditionName: String {
        switch cityWeather!.current.weather[0].id {
        case 200...232:
            return "11d"
        case 300...321:
            return "09d"
        case 500...531:
            return "10d"
        case 600...622:
            return "13d"
        case 701...781:
            return "50d"
        case 800:
            return "01d"
        case 801...804:
            return "04d"
        default:
            return "04d"
        }
    }
    
}
