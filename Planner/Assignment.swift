//
//  Assignment.swift
//  Planner
//
//  Created by Arunima Dey on 10/7/20.
//  Copyright © 2020 Arunima Dey. All rights reserved.
//

import UIKit
import Foundation

class Assignment {
    var category: Category
    var dueDate: NSDate
    var checkedOff: Bool
    var remindTimePrior1: Double
    var remindTimePrior2: Double
    
    init(category: Category, dueDate: NSDate, checkedOff: Bool, remindTimePrior1: Double, remindTimePrior2: Double){
        self.category = category
        self.dueDate = dueDate
        self.checkedOff = checkedOff
        self.remindTimePrior1 = remindTimePrior1
        self.remindTimePrior2 = remindTimePrior2
    }
    
    func main(){
        
    }
    
}
