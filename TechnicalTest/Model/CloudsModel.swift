//
//  CloudsModel.swift
//  TechnicalTest
//
//  Created by Patchar Promtha on 2/7/2565 BE.
//
import ObjectMapper

class CloudsModel :ObjectMapperModel {

    var all:Int? = 0
    
    
    override func mapping(map: Map) {
        super.mapping(map: map)

        all <- map["all"]
    }
}
