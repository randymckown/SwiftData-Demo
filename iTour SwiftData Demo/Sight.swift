//
//  Sight.swift
//  iTour SwiftData Demo
//
//  Created by Randy McKown on 11/1/24.
//

import Foundation
import SwiftData

@Model
class Sight {
    var name: String = "Unknown"

    init(name: String) {
        self.name = name
    }
}
