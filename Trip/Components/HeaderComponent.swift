//
//  HeaderComponent.swift
//  Trip
//
//  Created by Nileshkumar M. Prajapati on 2023/04/22.
//

import SwiftUI

struct HeaderComponent: View {
    
    //MARK: - Body
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Capsule()
                .frame(width: 120, height: 6)
                .foregroundColor(.secondary)
                .opacity(0.2)
                        
            Image("trip")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 50)
        }
    }
}

//MARK: - Preview

struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponent()
            .previewLayout(.fixed(width: 375, height: 150))
    }
}
