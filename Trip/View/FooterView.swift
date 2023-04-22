//
//  FooterView.swift
//  Trip
//
//  Created by Nileshkumar M. Prajapati on 2023/04/22.
//

import SwiftUI

struct FooterView: View {
    
    //MARK: - Properties
    
    @Binding var showBookAlert: Bool
    
    //MARK: - Body
    
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))
            
            Spacer()
            
            Button {
                //Print
                play(sound: "sound-click", type: "mp3")
                self.showBookAlert.toggle()
            } label: {
                Text("Book Destination".uppercased())
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .tint(.pink)
                    .background(
                        Capsule()
                            .stroke(.pink, lineWidth: 2)
                    )
            }
            
            Spacer()
            
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
        }
        .padding()
    }
}

//MARK: - Preview

struct FooterView_Previews: PreviewProvider {
    @State static var showAlert: Bool = false
    
    static var previews: some View {
        FooterView(showBookAlert: $showAlert)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
