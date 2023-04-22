//
//  InfoView.swift
//  Trip
//
//  Created by Nileshkumar M. Prajapati on 2023/04/22.
//

import SwiftUI

struct InfoView: View {
    
    //MARK: - Properties
    
    @Environment(\.dismiss) private var dismiss

    //MARK: - Body

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                    .frame(maxHeight: 60)
                
                Spacer(minLength: 10)
                
                Text("App Info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                AppInfoView()
                
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                CreditsView()
                
                Spacer(minLength: 10)
                
                Button {
                    dismiss()
                } label: {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }
    }
}

//MARK: - Preview

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
