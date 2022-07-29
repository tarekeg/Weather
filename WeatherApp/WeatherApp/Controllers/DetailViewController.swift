//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Tarek El Ghoul on 29/07/2022.
//

import UIKit
import WeatherService

class DetailViewController: UIViewController {
    
    @IBOutlet weak var WeatherImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    
    let weatherService = WeatherService.instance
    var longitude: Double?
    var latitude: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCityWeatherData(coord: (latitude: latitude!, longitude: longitude!)) { [self] weatherData, error in
            if error != nil {
                print(error)
            } else {
                DispatchQueue.main.async { [self] in
                    minTempLabel.text = "\(weatherData?.daily.first?.temp.min ?? 0)°"
                    maxTempLabel.text = "\(weatherData?.daily.first?.temp.max ?? 0)°"
                    descriptionLabel.text = "\(weatherData?.current.weather.first?.main ?? "Cloud")"
                    WeatherImageView.image = UIImage(named: "\(weatherData?.current.weather.first?.icon ?? "cloud.rain")")
                    temperatureLabel.text = "\(weatherData?.current.temp ?? 0)"
                }
                
            }
        }
        
    }
    
    func getCityWeatherData(coord: (latitude: Double,longitude : Double),completion: @escaping (WeatherData?, Error?) -> ()) {
        
        weatherService.currentWeather(coord: coord) { weatherData, error in
            if error != nil {
                print(error)
            } else {
                completion(weatherData,error)
            }
        }
        
    }
}
