//
//  WeatherItem.swift
//  WeatherService
//
//  Created by Tarek El Ghoul on 27/07/2022.
//

import Foundation

public struct WeatherCurrent: Codable {
    public var weather: [WeatherDescriptor]
    public var temp: Double
    
}
