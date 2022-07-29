//
//  RequestBuilder.swift
//  WeatherService
//
//  Created by Tarek El Ghoul on 28/07/2022.
//

import Foundation

// TODO: add parameters validation

internal class RequestBuilder {

    private var appId: String?
    private var baseURL: String
    private var latitude: Double?
    private var longitude: Double?

    init() {
        self.baseURL = Constants.Endpoints.API_URL
    }

    func setLatitude(_ lat: Double) -> RequestBuilder {
        self.latitude = lat
        return self
    }

    func setLongitude(_ lon: Double) -> RequestBuilder {
        self.longitude = lon
        return self
    }

    func setAppId(appId: String?) -> RequestBuilder {
        self.appId = appId
        return self
    }

    func build() -> String {


        if let latitude = latitude {
            baseURL += "lat=\(latitude)"
        }

        if let longitude = longitude {
            baseURL += "&lon=\(longitude)"
        }

        if let appId = appId {
            baseURL += "&appid=\(appId)"
        }
        
        baseURL += "&units=metric"

        return baseURL
    }
}
