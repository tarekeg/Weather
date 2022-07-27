//
//  WeatherService.swift
//  WeatherService
//
//  Created by Tarek El Ghoul on 27/07/2022.
//

import Foundation


public class WeatherService {
    public static var appId: String?
    
    public static let instance = WeatherService()
    
    private init() {
    }
    
    public class func initialize(withAppId appId: String) {
        self.appId = appId
    }
    
    
    
    
    
}
