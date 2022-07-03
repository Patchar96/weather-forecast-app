//
//  MainModel.swift
//  TechnicalTest
//
//  Created by Patchar Promtha on 2/7/2565 BE.
//

import ObjectMapper

class MainModel :ObjectMapperModel {

    var temp :Double? = 0.0
    var feels_like :Double? = 0.0
    var temp_min :Double? = 0.0
    var temp_max :Double? = 0.0
    var pressure :Int? = 0
    var sea_level :Int? = 0
    var humidity :Int? = 0
    var temp_k :Double? = 0.0
    
    
    override func mapping(map: Map) {
        super.mapping(map: map)

        temp <- map["temp"]
        feels_like <- map["feels_like"]
        temp_min <- map["temp_min"]
        temp_max <- map["temp_max"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
        sea_level <- map["sea_level"]
        temp_k <- map["temp_k"]
    }
}
