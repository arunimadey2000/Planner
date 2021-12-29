//
//  Event.swift
//  Planner
//
//  Created by Arunima Dey on 12/27/21.
//  Copyright © 2021 Arunima Dey. All rights reserved.
//

import Foundation

struct Event: Codable{
    var name: String
    var category: Category
    var dueDate: String
    var dueTime: String
    var checkedOff: Bool
    var remindTimePrior1: Double
    var remindTimePrior2: Double
    
}
