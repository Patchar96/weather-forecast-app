//
//  WindModel.swift
//  TechnicalTest
//
//  Created by Patchar Promtha on 2/7/2565 BE.
//

import ObjectMapper

class WindModel :ObjectMapperModel {

    var speed:Double? = 0.0
    var deg :Double? = 0.0
    var gust:Double? = 0.0
    
    
    override func mapping(map: Map) {
        super.mapping(map: map)

        speed <- map["speed"]
        deg <- map["deg"]
        gust <- map["gust"]
    }
}
