//
//  DetailWeatherModel.swift
//  TechnicalTest
//
//  Created by Patchar Promtha on 2/7/2565 BE.
//

import ObjectMapper

class DetailWeatherModel :ObjectMapperModel {

    var id :Int? = 0
    var main :String? = ""
    var description :String? = ""
    var icon :String? = ""
    
    
    
    override func mapping(map: Map) {
        super.mapping(map: map)

        id <- map["id"]
        main <- map["main"]
        description <- map["description"]
        icon <- map["icon"]
    }
}
