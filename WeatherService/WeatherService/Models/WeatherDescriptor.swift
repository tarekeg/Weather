//
//  WeatherDescriptor.swift
//  WeatherService
//
//  Created by Tarek El Ghoul on 27/07/2022.
//

import Foundation


public struct WeatherDescriptor: Codable {
    public var id: Int
    public var main: String
    public var description: String
    public var icon: String
}
