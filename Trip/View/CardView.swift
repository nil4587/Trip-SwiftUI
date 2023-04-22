//
//  CardView.swift
//  Trip
//
//  Created by Nileshkumar M. Prajapati on 2023/04/22.
//

import SwiftUI

struct CardView: View, Identifiable {

    //MARK: - Properties
    
    var destination: Destination
    var id = UUID()
    
    //MARK: - Body
    
    var body: some View {
        Image(destination.image)
            .resizable()
            .cornerRadius(24)
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay(
                VStack(alignment: .center, spacing: 12) {
                    Text(destination.place.uppercased())
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .shadow(radius: 1)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 4)
                        .overlay(
                            Rectangle()
                                .fill(.white)
                                .frame(height: 1),
                            alignment: .bottom
                        )
                    Text(destination.country.uppercased())
                        .foregroundColor(.black)
                        .font(.footnote)
                        .fontWeight(.bold)
                        .frame(minWidth: 85)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .fill(.white)
                        )
                }
                .frame(minWidth: 280)
                .padding(.bottom, 50),
                alignment: .bottom
            )
    }
}

//MARK: - Preview

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(destination: tripData.first!)
            .previewLayout(.fixed(width: 375, height: 600))
    }
}
