//
//  MainTabView.swift
//  Airbnb clone
//
//  Created by Cristian David Laguna Aldana on 28/08/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem{ Label("Explore", systemImage: "magnifyingglass") }
            
            WishListsView()
                .tabItem{ Label("Wishlists", systemImage: "heart") }
            
            ProfileView()
                .tabItem{ Label("Profile", systemImage: "person") }
        }
    }
}

#Preview {
    MainTabView()
}
