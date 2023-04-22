//
//  HeaderView.swift
//  Trip
//
//  Created by Nileshkumar M. Prajapati on 2023/04/22.
//

import SwiftUI

struct HeaderView: View {
    
    //MARK: - Properties
    
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    
    //MARK: - Body
    
    var body: some View {
        HStack {
            Button {
                play(sound: "sound-click", type: "mp3")
                self.showInfoView.toggle()
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .tint(.primary)
            
            Spacer()
            
            Image("trip-colorful")
                .resizable()
                .aspectRatio(contentMode: .fit)

            Spacer()
            
            Button {
                play(sound: "sound-click", type: "mp3")
                self.showGuideView.toggle()
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .tint(.primary)
            .sheet(isPresented: $showGuideView) {
                GuideView()
            }
            .sheet(isPresented: $showInfoView) {
                InfoView()
            }
        }
        .padding()
    }
}

//MARK: - Preview

struct HeaderView_Previews: PreviewProvider {
    @State static var showGuide: Bool = false
    @State static var showInfo: Bool = false
    
    static var previews: some View {
        HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
