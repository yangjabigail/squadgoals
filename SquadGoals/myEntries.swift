//
//  myEntries.swift
//  SquadGoals
//
//  Created by Abigail Yang on 2/27/18.
//  Copyright © 2018 Abigail Yang. All rights reserved.
//

import Foundation

class myEntries {
    var title: String
    var date: String
    var body: String
    
    init(title: String, date: String, body: String) {
        self.title = title
        self.date = date
        self.body = body
    }
}

// get whatever text is inside the box
// save it to a component's property (postTitle) which can be used later
// if you have an array property you can
// use a loop to put each array item into a table row
