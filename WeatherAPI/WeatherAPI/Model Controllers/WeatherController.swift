//
//  WeatherController.swift
//  WeatherAPI
//
//  Created by Kevin Tanner on 8/15/19.
//  Copyright © 2019 Kevin Tanner. All rights reserved.
//

import Foundation

// https://api.darksky.net/forecast/83e3034647d9444ddd308d1ba30f44f2/37.8267,-122.4233
// https://api.darksky.net/forecast/83e3034647d9444ddd308d1ba30f44f2/34.0522,118.2437

class WeatherController {
    
    func fetchWeatherForcast(latitude: Double, longitude: Double, completion: @escaping ([Day]?) -> Void) {
        
        guard let baseURL = URL(string: "https://api.darksky.net/forecast") else {
            completion(nil)
            return
        }
        
        var builtURL = baseURL
        builtURL.appendPathComponent("83e3034647d9444ddd308d1ba30f44f2")
        builtURL.appendPathComponent("\(latitude),\(longitude)")
        
        print(builtURL)
        
        let dataTask = URLSession.shared.dataTask(with: builtURL) { (data, _, error) in
            
            if let error = error {
                print("There was an error with the url \(error) \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("There was no data")
                completion(nil)
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                
                let topLevelDict = try jsonDecoder.decode(Weather.self, from: data)
                
                completion(topLevelDict.daily.data)
                
            } catch {
                print("There was an error decoding Json")
                completion(nil)
                return
            }
        }
        dataTask.resume()
    }
}
