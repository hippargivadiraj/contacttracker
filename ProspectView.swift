//
//  ProspectView.swift
//  ContactTracker
//
//  Created by Vadiraj Hippargi on 1/19/20.
//  Copyright © 2020 Vadiraj Hippargi. All rights reserved.
//

import SwiftUI

struct ProspectView: View {
    
    @EnvironmentObject var prospects : Prospects
    
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
    
    var filteredProspects: [Prospect]{
        
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter { $0.isContacted}
        case .uncontacted:
            return prospects.people.filter { !$0.isContacted}
            
        }
    }
    
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(filteredProspects) { prospect in
                    VStack {
                        Text( prospect.name )
                            .font(.headline)
                        Text(prospect.emailAddress)
                            .foregroundColor(.secondary)
                        
                    }
                    
                }
                
                
                
            }
                .navigationBarTitle(title)
                .navigationBarItems(trailing: Button(action: {
                    let prospect = Prospect()
                    prospect.name = "Vadi"
                    prospect.emailAddress = "abc@nbv.com"
                    self.prospects.people.append(prospect)
                }) {
                    Image(systemName: "qrcode.viewfinder")
                    Text("Scan")
                })
        }
        
    }
}

struct ProspectView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectView(filter: .none)
    }
}
