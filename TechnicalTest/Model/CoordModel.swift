//
//  CoordModel.swift
//  TechnicalTest
//
//  Created by Patchar Promtha on 2/7/2565 BE.
//

import ObjectMapper

class CoordModel :ObjectMapperModel {

    var lon:Double? = 0.0
    var lat :Double? = 0.0
    
    
    override func mapping(map: Map) {
        super.mapping(map: map)

        lon <- map["lon"]
        lat <- map["lat"]
    }
}
