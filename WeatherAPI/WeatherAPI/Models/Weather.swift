//
//  Weather.swift
//  WeatherAPI
//
//  Created by Kevin Tanner on 8/15/19.
//  Copyright © 2019 Kevin Tanner. All rights reserved.
//

import Foundation

// Level 1
struct Weather: Decodable {
    
//    let currently: Currently
    let daily: Daily
//    let temperature: Double
//    let weatherTypeToday: String
//    let weatherTypeTomorrow: String
//
//    enum CodingKeys: String, CodingKey {
//        case weatherTypeToday = "icon"
//        case weatherTypeTomorrow = "icon"
//    }
}

//struct Currently: Decodable {
//    let temperature: Double
//    let weatherType: String
//
//    enum CodingKeys: String, CodingKey {
//        case weatherType = "summary"
//        case temperature
//    }
//}

// Level 2
struct Daily: Decodable {
    let data: [Day]
}

// Level 3
struct Day: Decodable {
    let temperatureMax: Double
    let weatherType: String
    
    enum CodingKeys: String, CodingKey {
        case temperatureMax
        case weatherType = "summary"
    }
}
