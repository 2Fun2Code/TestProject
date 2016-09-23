//
//  Person.swift
//  ScorecardProject
//
//  Created by Henrik Olsson on 16/09/16.
//
//

import Foundation

class Person: Mappable {
    var name: String?
    var birthDate: Date?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        birthDate <- (map["birthDate"], CustomDateFormatTransform(formatString: "yyyyMMdd"))
    }
}
