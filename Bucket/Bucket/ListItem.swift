//
//  ListItem.swift
//  Bucket
//
//  Created by Patrick Anderson on 9/26/16.
//  Copyright © 2016 Cameo. All rights reserved.
//

import UIKit

class ListItem: NSObject {

    var text: String
    var info: String
    var completed: Bool
    
    // Returns a ToDoItem initialized with the given text and default completed value.
    init(text: String, completed: Bool, info: String) {
        self.text = text
        self.completed = completed
        self.info = info
    }
}
