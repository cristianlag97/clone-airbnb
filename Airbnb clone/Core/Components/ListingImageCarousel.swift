//
//  ListingImageCarousel.swift
//  Airbnb clone
//
//  Created by Cristian David Laguna Aldana on 27/05/24.
//

import SwiftUI

struct ListingImageCarousel: View {
    
    var images: [String] = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
    ]
    
    var body: some View {
        TabView{
            ForEach(images, id: \.self) { image in
                 Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarousel()
}
