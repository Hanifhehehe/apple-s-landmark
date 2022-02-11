//
//  FavoriteButton.swift
//  Landmark
//
//  Created by Hanif Pramono on 14/04/21.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
// A binding controls the storage for a value, so you can pass data around to different views that need to read or write it
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }, label: {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? Color.yellow : Color.gray)
        })
        
        
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
