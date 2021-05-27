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
    var category = ""
    var color: UIColor
    var dueDate: NSDate
    var checkedOff: Bool
    var remindTimePrior1: Double
    var remindTimePrior2: Double
    
    var arr = [1,2,4,5]

    
    init(category: String, color: UIColor, dueDate: NSDate, checkedOff: Bool, remindTimePrior1: Double, remindTimePrior2: Double){
        self.category = category
        self.color = color
        self.dueDate = dueDate
        self.checkedOff = checkedOff
        self.remindTimePrior1 = remindTimePrior1
        self.remindTimePrior2 = remindTimePrior2
        
    }
    
    func main(){
        let inserting = 3
        var temp: Int
        var temp2: Int
        for i in arr{
            if( inserting < arr[i] ){
                temp = arr[i]
                arr[i] = inserting
                for j in i+1...arr.count{
                    temp2 = arr[j]
                    arr[j] = temp
                    temp = temp2
                }
            }
        }
        print("array: \(arr)" )
    }
    
}
