//
//  WeatherModel.swift
//  WeatherAppTest
//
//  Created by mac on 21/02/22.
//

import Foundation

struct WetherModel: Codable {
    var location : LocationModel?
    var current : CurrentModel?
    var forecast : ForecastModel?
}

struct LocationModel: Codable {
    var name : String?
    var region : String?
    var country : String?
    var lat : Double?
    var lon : Double?
    var tz_id : String?
    var localtime_epoch : Double?
    var localtime : String?
}

struct CurrentModel: Codable {
    var last_updated_epoch : Double?
    var temp_c : Double?
    var is_day: Int?
    var is_conditionday: ConditionModel?
}

struct ConditionModel: Codable {
    var text : String?
    var icon : String?
    var code : Int?
}

struct ForecastModel: Codable {
    var forecastday : [ForecastdaytModel]?
}

struct ForecastdaytModel: Codable {
    var date : String?
    var date_epoch : Double?
    var day : DayModel?
    var astro : AstroModel?
    var hour : [HourModel]?
}

struct DayModel: Codable {
    var maxtemp_c : Double?
    var mintemp_c : Double?
    var avgtemp_c : Double?
    var condition: ConditionModel?
}

struct AstroModel: Codable {
    var sunrise : String?
    var sunset : String?
}

struct HourModel: Codable {
    var time_epoch : Double?
    var temp_c : Double?
    var is_day: Int?
    var condition: ConditionModel?
}
