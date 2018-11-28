//
//  TaskClass.swift
//  Task Manager iOS
//
//  Created by Gabriela Torres on 11/28/18.
//  Copyright © 2018 Gabriela Torres. All rights reserved.
//

import Foundation

//Super Class 
class Tasks {
    var title: String
    var details: String
    var completionStatus: Bool = false
    var dueDate: Date?
    
    init(title: String, details: String) {
        self.title = title
        self.details = details
    }
}
