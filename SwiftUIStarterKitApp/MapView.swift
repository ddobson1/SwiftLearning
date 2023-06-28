//
//  MapView.swift
//  SwiftUIStarterKitApp
//
//  Created by David Dobson on 28/06/2023.
//  Copyright © 2023 NexThings. All rights reserved.
//

import Foundation
import SwiftUI
// 1.
import MapKit

struct MapView: View {
    // 2.
    @State private var region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: 40.83834587046632,
                    longitude: 14.254053016537693),
                span: MKCoordinateSpan(
                    latitudeDelta: 0.03,
                    longitudeDelta: 0.03)
                )

    var body: some View {
        // 3.
        if #available(iOS 14.0, *) {
            Map(coordinateRegion: $region)
                .edgesIgnoringSafeArea(.all)
        } else {
            // Fallback on earlier versions
        }
    }
}
