//
//  ProspectView.swift
//  ContactTracker
//
//  Created by Vadiraj Hippargi on 1/19/20.
//  Copyright © 2020 Vadiraj Hippargi. All rights reserved.
//

import SwiftUI

struct ProspectView: View {
    
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    let filter : FilterType
    
    var title: String{
        
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
                       return "Contacted People"
        case .uncontacted:
                   return "Uncontacted People"
            
        }
    }
    
    var body: some View {
        NavigationView{
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        .navigationBarTitle(title)
    }
    
}
}

struct ProspectView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectView(filter: .none)
    }
}
