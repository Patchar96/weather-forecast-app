//
//  MainListModel.swift
//  TechnicalTest
//
//  Created by Patchar Promtha on 2/7/2565 BE.
//

import ObjectMapper
class MainListModel :ObjectMapperModel {

    var temp :Double? = 0
    var feels_like :Double? = 0
    var temp_min :Double? = 0
    var temp_max :Double? = 0
    var dt :Double? = 0
    var main :Double? = 0
    var dt :Double? = 0
    var main :Double? = 0
    
    override func mapping(map: Map) {
        super.mapping(map: map)

        temp <- map["temp"]
        feels_like <- map["feels_like"]
        temp_min <- map["temp_min"]
        temp_max <- map["temp_max"]
        dt <- map["dt"]
        main <- map["main"]
        dt <- map["dt"]
        main <- map["main"]
    }
}
