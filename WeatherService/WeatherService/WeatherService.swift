//
//  WeatherService.swift
//  WeatherService
//
//  Created by Tarek El Ghoul on 27/07/2022.
//

import Foundation


public class WeatherService {
    public static var appId: String?
    public class func initialize(withAppId appId: String) {
        self.appId = appId
    }
}
