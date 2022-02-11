//
//  LandmarkRow.swift
//  Landmark
//
//  Created by Hanif Pramono on 13/04/21.
//

//This one is for creating rows that will be used in a list view

import SwiftUI

struct LandmarkRow: View {
    // When you add the landmark property the preview stops working, because the LandmarkRow type needs an instance during initialization
    var landmark: Landmark
    
    var body: some View {
        HStack {
            
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            
            // referring the data by the name from ModelData.swift
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                
            }
            
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        Group {
            // Group is a container for grouping view content. Xcode render the group's child views as seperate previews in the canvas
            
            LandmarkRow(landmark: landmarks[0])
            // The landmarks was declared in ModelData.swift
            // The bracketed number refers to the order of data on .json file
            LandmarkRow(landmark: landmarks[1])
        }
            .previewLayout(.fixed(width: 300, height: 70))
            // This modifier changes the view into a size that approximates a row in a list
            // This modifier placed right after a group so it acts as a modifier for every member of the group
    }
}
