//
//  Prospect.swift
//  ContactTracker
//
//  Created by Vadiraj Hippargi on 1/19/20.
//  Copyright © 2020 Vadiraj Hippargi. All rights reserved.
//

import Foundation
class Prospect: Identifiable, Codable {
    let id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var isContacted = false
    
}

class Prospects: ObservableObject {
 @Published var people : [Prospect]
    
    init(){
        self.people = []
    }
}
