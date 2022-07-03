//
//  RainModel.swift
//  TechnicalTest
//
//  Created by Patchar Promtha on 2/7/2565 BE.
//

import ObjectMapper

class RainModel :ObjectMapperModel {

    var 3h :Double? = 0.0
    
    
    override func mapping(map: Map) {
        super.mapping(map: map)

        3 <- map["3h"]
    }
}
