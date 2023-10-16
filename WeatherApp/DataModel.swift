//
//  DataModel.swift
//  WeatherApp
//
//  Created by Rishop on 16/10/23.
//

import Foundation

struct WeatherDay {
    let dayOfWeek: String
    let imageName: String
    let temperature: Int
}


let weatherData: [WeatherDay] = [
    WeatherDay(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 76),
    WeatherDay(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 88),
    WeatherDay(dayOfWeek: "THU", imageName: "wind.snow", temperature: 55),
    WeatherDay(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 60),
    WeatherDay(dayOfWeek: "SAT", imageName: "snow", temperature: 25)
]
