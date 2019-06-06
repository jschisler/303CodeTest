//
//  Person.swift
//  303CodeTest
//
//  Created by John Schisler on 2019-06-06.
//  Copyright © 2019 Schisler Rocks. All rights reserved.
//

import Foundation

struct Person: Codable {
    var firstName : String
    var lastName : String
    var city : String

    enum CodingKeys: String, CodingKey {
        case firstName = "fname"
        case lastName = "lname"
        case city
    }
}
