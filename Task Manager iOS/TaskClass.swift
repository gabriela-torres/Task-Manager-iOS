//
//  TaskClass.swift
//  Task Manager iOS
//
//  Created by Gabriela Torres on 11/28/18.
//  Copyright © 2018 Gabriela Torres. All rights reserved.
//

import Foundation

let calendar = Calendar(identifier: .gregorian)
let dueDate = calendar.date(byAdding: .day, value: 7, to: Date())!

class Tasks {
    //Priority- to see how important the task is
    enum Priority: String {
        case priority = "Important"
        case notPriority = "Not Important"
    }
    
    //Checks to see if task is complete or not
    enum Completion {
        case complete
        //Due date if task is incomplete
        case incomplete(dueDate: Date)
    }
   
    let taskTitle: String
    let details: String
    let priority: Priority
    var completion: Completion
    
    init(taskTitle: String, details: String, priority: Priority) {
        self.taskTitle = taskTitle
        self.details = details
        self.priority = priority
        self.completion = .incomplete(dueDate: dueDate)
    }
}
