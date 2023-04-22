//
//  RowAppInfoView.swift
//  Trip
//
//  Created by Nileshkumar M. Prajapati on 2023/04/22.
//

import SwiftUI

struct RowAppInfoView: View {
    
    //MARK: - Properties
    
    var keyTitle: String
    var keyValue: String
    
    //MARK: - Body
    
    var body: some View {
        VStack {
            HStack {
                Text(keyTitle)
                    .foregroundColor(.gray)
                Spacer()
                Text(keyValue)
            }
            
            Divider()
        }
    }
}

//MARK: - Preview

struct RowAppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RowAppInfoView(keyTitle: "Application", keyValue: "Trip")
    }
}
