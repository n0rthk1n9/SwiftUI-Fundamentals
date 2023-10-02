//
//  StacksChallenge.swift
//  SwiftUI-Fundamentals
//
//  Created by Jan Armbrust on 02.10.23.
//

import SwiftUI

struct StacksChallenge: View {
    let weather = Weather()

    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            CurrentConditions()

            Divider()

            HStack {
                ForEach(weather.hourlyForecast, id: \.hour) { forecast in
                    Spacer()
                    HourlyForecastView(hour: forecast.hour, conditions: forecast.conditions, temperature: forecast.temperature)
                    Spacer()
                }
            }
        }
        .padding()
        .foregroundColor(.white)
        .background(
            Color("lightBlue")
        )
        .padding(5)
        .overlay {
            Rectangle()
                .foregroundColor(Color.clear)
                .border(Color.gray.opacity(0.3), width: 5.0)
        }
    }
}

struct Weather {
    struct Forecast: Identifiable {
        let id = UUID()
        let hour: String
        let conditions: Image
        let temperature: String
    }

    let hourlyForecast = [
        Forecast(hour: "8AM", conditions: Image(systemName: "sun.max.fill"), temperature: "63°"),
        Forecast(hour: "9AM", conditions: Image(systemName: "cloud.sun.fill"), temperature: "63°"),
        Forecast(hour: "10AM", conditions: Image(systemName: "sun.max.fill"), temperature: "64°"),
        Forecast(hour: "11AM", conditions: Image(systemName: "cloud.fill"), temperature: "61°"),
        Forecast(hour: "12PM", conditions: Image(systemName: "cloud.rain.fill"), temperature: "62°")
    ]
}

struct StacksChallenge_Previews: PreviewProvider {
    static var previews: some View {
        Image("challenge")
            .resizable()
            .scaledToFit()
            .previewLayout(.sizeThatFits)

        StacksChallenge()
            .previewLayout(.sizeThatFits)
    }
}

struct HourlyForecastView: View {
    let hour: String
    let conditions: Image
    let temperature: String

    var body: some View {
        VStack {
            Text(hour)
            conditions
                .renderingMode(.original)
                .frame(height: 50)
            Text(temperature)
        }
    }
}

struct CurrentConditions: View {
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            VStack(alignment: .leading) {
                Text("Cupertino")
                    .font(.title3)
                Text("63°")
                    .font(.largeTitle)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Image(systemName: "sun.max.fill")
                    .renderingMode(.original)
                Text("Sunny")
                Text("H:68° L:42°")
            }
        }
    }
}
