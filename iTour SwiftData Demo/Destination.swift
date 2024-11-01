//
//  Untitled.swift
//  iTour SwiftData Demo
//
//  Created by Randy McKown on 10/31/24.
//

import Foundation
import SwiftData

@Model
class Destination {
    var name: String = "Anonymous"
    var details: String = "Unknown"
    var date: Date = Date.now
    var priority: Int = 2
    @Relationship(deleteRule: .cascade) var sights: [Sight]? = [Sight]()
    
    var unwrappedSights: [Sight] {
        sights ?? []
    }
    
    init(name: String = "", details: String = "", date: Date = .now, priority: Int = 2) {
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
}
