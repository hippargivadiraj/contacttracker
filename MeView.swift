//
//  MeView.swift
//  ContactTracker
//
//  Created by Vadiraj Hippargi on 1/19/20.
//  Copyright © 2020 Vadiraj Hippargi. All rights reserved.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct MeView: View {
    @State private var name = "Anonymous"
    @State private var emailAddress = "you@yourEmail.com"
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationView{
            VStack {
               TextField( "Name" , text:  $name )
                .textContentType(.name)
                .font(.title)
                .padding([.horizontal, .bottom])
                
                TextField( "Email Address" , text:  $emailAddress )
                 .textContentType(.emailAddress)
                 .font(.title)
                 .padding([.horizontal, .bottom])
                
                Spacer()
                
                Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
                    .interpolation(.none)
                .resizable()
                .scaledToFit()
                .frame(width:200, height: 200)
                
                

            }
        }
    }
    
    func generateQRCode(from string:String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        
        if let outputImage = filter.outputImage{
            
            if let cgimage = context.createCGImage(outputImage, from: outputImage.extent){
                return UIImage(cgImage: cgimage)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
    
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
