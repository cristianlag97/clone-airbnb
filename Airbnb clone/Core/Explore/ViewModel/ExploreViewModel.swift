//
//  ExploreViewModel.swift
//  Airbnb clone
//
//  Created by Cristian David Laguna Aldana on 16/09/24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var searchLocation = ""
    private let service: ExploreService
    
    private var listingsCopy = [Listing]()
    
    init(service: ExploreService) {
        self.service = service
        
        Task {
            await fetchListing()
        }
    }
    
    func fetchListing() async {
        do {
            self.listings = try await service.fetchListing()
            self.listingsCopy = listings
        } catch {
            print("DEBUG: Failed to fetch listing with error: \(error.localizedDescription)")
        }
    }
    
    func updateListingForLocation() {
        let filteredListings = listings.filter({
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        })
        
        
        self.listings = filteredListings.isEmpty ? listingsCopy : filteredListings
    }
}
