//
//  SysModel.swift
//  TechnicalTest
//
//  Created by Patchar Promtha on 2/7/2565 BE.
//

import ObjectMapper

class SysModel :ObjectMapperModel {

    var type:Int? = 0
    var id:Int? = 0
    var country:String? = ""
    var sunrise:Int? = 0
    var sunset:Int? = 0
    var pod:String? = ""
    
    override func mapping(map: Map) {
        super.mapping(map: map)

        type <- map["type"]
        id <- map["id"]
        country <- map["country"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
        pod <- map["pod"]
    }
}
