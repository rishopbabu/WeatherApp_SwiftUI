//
//  ContentView.swift
//  WeatherApp
//
//  Created by Rishop Babu on 16/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight: Bool = true
    
    let myWeatherData = weatherData
    
    var body: some View {
        
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Coimbatore")
                
                MainWeartherView(imageName: isNight ? "moon.stars.fill" :"cloud.sun.fill", temperature: 76)
                
                
                HStack(spacing: 20) {
                    
                    ForEach(myWeatherData, id: \.dayOfWeek) { datum in
                        WeatherDayView(dayOfWeek: datum.dayOfWeek, imageName: datum.imageName, temperature: datum.temperature)
                    }
                    
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: isNight ? "Change Day Time" : "Change Night Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(Color.white)
            
            Image(systemName: imageName)
                //.renderingMode(.original)
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(.pink, .gray, .green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(Color.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("LightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text("\(cityName), India")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(Color.white)
            .padding()
    }
}

struct MainWeartherView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(Color.white)
        }
        .padding(.bottom, 60)
    }
}

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundStyle(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .clipShape(.capsule)
    }
}
