//
//  NetworkManager.swift
//  WeatherService
//
//  Created by Tarek El Ghoul on 27/07/2022.
//

import Foundation

import Foundation

internal final class NetworkManager {

    internal static let instance = NetworkManager()

    private init() {
    }

    internal func get<T : Codable>(from url: String,
                                   completion: @escaping (T?, Error?) -> ()) {
        guard let serviceUrl = URL(string: url) else { return }
        URLSession.shared.dataTask(with: serviceUrl) { (data, response, error) in
            if let error = error {
                completion(nil, error)
            }
            guard let data = data else { return }

            let decoder = JSONDecoder() 
            do {
                let result = try decoder.decode(T.self, from: data)
                completion(result, nil)
            } catch {
                completion(nil, error)
            }
            }.resume()
    }
}
