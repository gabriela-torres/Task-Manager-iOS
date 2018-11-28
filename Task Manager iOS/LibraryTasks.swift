//
//  Task Data Class.swift
//  Task Manager iOS
//
//  Created by Gabriela Torres on 11/28/18.
//  Copyright © 2018 Gabriela Torres. All rights reserved.
//

import Foundation


class LibraryTasks {
    static let sharedInstance = LibraryTasks()
    
    var tasks = [Tasks]()
}

