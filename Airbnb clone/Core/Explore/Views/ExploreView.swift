//
//  ExploreView.swift
//  Airbnb clone
//
//  Created by Cristian David Laguna Aldana on 22/05/24.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack {
            
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
                    
            } else {
                ScrollView {
                    SearchAndFilterBar(location: $viewModel.searchLocation)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView .toggle()
                            }
                        }
                    LazyVStack(spacing: 32) {
                        //ForEach(0 ... 10, id: \.self) { listing in
                        ForEach(viewModel.listings) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                    //Text("Listing detail View...")
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
