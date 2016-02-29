//
//  TaskList.swift
//  RealmDemo
//
//  Created by Jason on 16/2/29.
//  Copyright © 2016年 com.kyleruan. All rights reserved.
//

import Foundation
import RealmSwift

class TaskList: Object {
    dynamic var name = ""
    dynamic var createdAt = NSDate()
     let tasks = List<Task>()
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
