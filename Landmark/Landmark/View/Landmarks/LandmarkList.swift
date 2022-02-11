//
//  LandmarkList.swift
//  Landmark
//
//  Created by Hanif Pramono on 13/04/21.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    // This sets the default view showing all landmarks.. favorites and non-favorites
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        
//        NavigationView {
//
//            List(filteredLandmarks) { landmark in
//                // The list instance is made for.. well creating a list...
//
//                // Lists work with identifiable data. We can make our data identifiable in one of two ways, by passing along our data a key path to a property that uniquely identifies each element, or by making your data type conform to the Identifiable protocol
//
//
//                // We can list the items by mentioning them one by one as well
//                // LandmarkRow(landmark: landmarks[0])
//                // LandmarkRow(landmark: landmarks[1])
//
//                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
//
//                LandmarkRow(landmark: landmark)
//                // This creates one LandmarkRow for each element in the landmarks array
//                }
//            }
//            .navigationTitle("Landmarks")
//
//        }
        NavigationView {
            
            List() {
                
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    
                    LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
            
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        
    //        LandmarkList()
    //
    //            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
    //        ForEach(["iPhone SE (2nd generation)" , "iPhone XS Max"], id: \.self) {deviceName in LandmarkList()
    //            .previewDevice(PreviewDevice(rawValue: deviceName))
    //        }
    }
}
