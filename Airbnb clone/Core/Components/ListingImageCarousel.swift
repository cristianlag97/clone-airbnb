//
//  ListingImageCarousel.swift
//  Airbnb clone
//
//  Created by Cristian David Laguna Aldana on 27/05/24.
//

import SwiftUI

struct ListingImageCarousel: View {
    let listing: Listing
    
    var body: some View {
        TabView{
            ForEach(listing.imageUrls, id: \.self) { image in
                 Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarousel(listing: DeveloperPreview.shared.listings[0])
}
