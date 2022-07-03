//
//  WeatherModel.swift
//  TechnicalTest
//
//  Created by Patchar Promtha on 2/7/2565 BE.
//

import ObjectMapper

class WeatherModel :ObjectMapperModel {

    var coord: CoordModel?
    var weather :[DetailWeatherModel]?
    var base :String? = ""
    var main: MainModel?
    var visibility :Int? = 0
    var wind :WindModel?
    var clouds :CloudsModel?
    var dt :Int? = 0
    var sys :SysModel?
    var timezone :Int? = 0
    var id :Int? = 0
    var name :String? = ""
    var cod :Int? = 0
    
    
    
    override func mapping(map: Map) {
        super.mapping(map: map)

        coord <- map["coord"]
        weather <- map["weather"]
        base <- map["base"]
        main <- map["main"]
        visibility <- map["visibility"]
        wind <- map["wind"]
        clouds <- map["clouds"]
        dt <- map["dt"]
        sys <- map["sys"]
        timezone <- map["timezone"]
        id <- map["id"]
        name <- map["name"]
        cod <- map["cod"]
    }
}
