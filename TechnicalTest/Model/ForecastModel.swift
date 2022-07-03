//
//  ForecastModel.swift
//  TechnicalTest
//
//  Created by Patchar Promtha on 2/7/2565 BE.
//

import ObjectMapper

class ForecastModel :ObjectMapperModel {

    var cod:String? = ""
    var message :Int? = 0
    var cnt :Int? = 0
    var list :[ListForecastModel]?
    var city: CityModel?
    
    override func mapping(map: Map) {
        super.mapping(map: map)

        cod <- map["cod"]
        message <- map["message"]
        cnt <- map["cnt"]
        list <- map["list"]
        city <- map["city"]
    }
}
