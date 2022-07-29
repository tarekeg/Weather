//
//  WeatherData.swift
//  WeatherService
//
//  Created by Tarek El Ghoul on 27/07/2022.
//

import Foundation

public struct WeatherData: Codable {
    public var current: WeatherCurrent
    public var daily: [WeatherDaily]
}
