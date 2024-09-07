//
//  WishListsView.swift
//  Airbnb clone
//
//  Created by Cristian David Laguna Aldana on 28/08/24.
//

import SwiftUI

struct WishListsView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 32) {
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log in to view your wishlists")
                        .font(.headline)
                    
                    Text("Youcan create, view or edit wishlists once you've logged in")
                        .font(.footnote)
                    
                }
                
                Button {
                    print("LogIn")
                } label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("Wishlists")
        }
    }
}

#Preview {
    WishListsView()
}
