//
//  Service.swift
//  WeatherAppTest
//
//  Created by mac on 21/02/22.
//

import Foundation

class Service: NSObject {
    
    static let shared = Service()
    
    let API_KEY = "522db6a157a748e2996212343221502"
    let NAME_OF_CITY = "Chennai"
    
    func fetchWeatherDetail(completion: @escaping (WetherModel?, Error?) -> ()) {
        let urlString = "https://api.weatherapi.com/v1/forecast.json?key=\(API_KEY)&q=\(NAME_OF_CITY)&days=7&aqi=no&alerts=no"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch wather detail:", err)
                return
            }
            
            // check response
            guard let data = data else { return }
            do {
                let courses = try JSONDecoder().decode(WetherModel.self, from: data)
                DispatchQueue.main.async {
                    completion(courses, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
        }.resume()
    }
}
