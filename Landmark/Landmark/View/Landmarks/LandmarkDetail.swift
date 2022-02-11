//
//  LandmarkDetail.swift
//  Landmark
//
//  Created by Hanif Pramono on 13/04/21.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
                // A way to make the mapview to ignore the top part of the safezone
                .ignoresSafeArea(edges: .top)
            
            CircleImage(image: landmark.image)
                // Instead of using ZStack, we can just give the image an offset to layer on top of the map view and doing the same thing for the bottom portion.
                .offset(y: -130)
                .padding(.bottom, -130)
            
            // Texts
            VStack (alignment: .leading) {
                // By default, stacks center their contents along their axis and provide context-appropriate spacing.
                
                
                // Title
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                // Details
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                // That divider thingy
                Divider()
                
                
                Text("About \(landmark.name)")
                    .font((.title2))
                Text(landmark.description)
                    .offset(y:20)
            }
            .padding()
            
            
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark:  ModelData() .landmarks[0])
            .environmentObject(modelData)
    }
}
