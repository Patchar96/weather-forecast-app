//
//  ListForecastModel.swift
//  TechnicalTest
//
//  Created by Patchar Promtha on 2/7/2565 BE.
//

import ObjectMapper
class ListForecastModel :ObjectMapperModel {

    var dt :Int? = 0
    var main :MainModel?
    var weather :[DetailWeatherModel]?
    var clouds :CloudsModel?
    var wind :WindModel?
    var visibility :Int? = 0
    var pop :Double? = 0.0
    var sys :SysModel?
    var dateTime:String? = ""

    
    override func mapping(map: Map) {
        super.mapping(map: map)

        dt <- map["dt"]
        main <- map["main"]
        weather <- map["weather"]
        clouds <- map["clouds"]
        wind <- map["wind"]
        visibility <- map["visibility"]
        pop <- map["pop"]
        sys <- map["sys"]
        dateTime <- map["dt_txt"]
    }
}
