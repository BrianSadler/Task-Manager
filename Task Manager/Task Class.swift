//
//  Task Class.swift
//  Task Manager
//
//  Created by Brian Sadler on 9/13/18.
//  Copyright © 2018 Brian Sadler. All rights reserved.
//

import Foundation
class Task {
    var title: String // stores title
    var Taskdescription: String
    var completed = false // tasks start as not completed
    var dueDate: Date?
    var priority: PrioritySelection
    enum PrioritySelection: Int {
    case High = 1
    case Low = 2
    }
    init(title: String, Taskdescription: String, dueDate: Date?, priority:PrioritySelection ) {
        self.title = title
        self.Taskdescription = Taskdescription
        self.dueDate = dueDate
        self.priority = priority
       
    }
   
    
  
    }



