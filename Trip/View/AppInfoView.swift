//
//  AppInfoView.swift
//  Trip
//
//  Created by Nileshkumar M. Prajapati on 2023/04/22.
//

import SwiftUI

struct AppInfoView: View {
    
    //MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RowAppInfoView(keyTitle: "Application", keyValue: "Trip")
            RowAppInfoView(keyTitle: "Platforms", keyValue: "iPhone, iPad")
            RowAppInfoView(keyTitle: "Developer", keyValue: "iOS Developer")
            RowAppInfoView(keyTitle: "Version", keyValue: "1.0.0")
        }
    }
}

//MARK: - Preview

struct AppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoView()
    }
}
