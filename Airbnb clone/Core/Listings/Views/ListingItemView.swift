//
//  ListingItemView.swift
//  Airbnb clone
//
//  Created by Cristian David Laguna Aldana on 22/05/24.
//

import SwiftUI

struct ListingItemView: View {
    
    var images: [String] = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            //Images
           ListingImageCarousel()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            //Listing details
            
            HStack(alignment: .top) {
                //detail
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text("12 my awai")
                        .foregroundColor(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 4) {
                        Text("$567")
                            .fontWeight(.semibold)
                        
                        Text("night")
                    }
                    .foregroundColor(.black)
                }
                
                Spacer()
                
                //rating
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    
                    Text("4.86")
                }
                .foregroundColor(.black)
            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView()
}
