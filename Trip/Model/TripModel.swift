//
//  TripModel.swift
//  Trip
//
//  Created by Nileshkumar M. Prajapati on 2023/04/22.
//

import SwiftUI

//MARK: - Trip Model

struct Destination: Identifiable {
    var id = UUID()
    var place: String
    var country: String
    var image: String
}
