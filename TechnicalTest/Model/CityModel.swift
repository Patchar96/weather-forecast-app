//
//  CityModel.swift
//  TechnicalTest
//
//  Created by Patchar Promtha on 2/7/2565 BE.
//

import ObjectMapper

class CityModel :ObjectMapperModel {

    var id:Int? = 0
    var name :String? = ""
    var coord :CoordModel?
    var country :String? = ""
    var population :Int? = 0
    var timezone :Int? = 0
    var sunrise :Int? = 0
    var sunset :Int? = 0
    
    override func mapping(map: Map) {
        super.mapping(map: map)

        id <- map["id"]
        name <- map["name"]
        coord <- map["coord"]
        country <- map["country"]
        population <- map["population"]
        timezone <- map["timezone"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
        
    }
}
