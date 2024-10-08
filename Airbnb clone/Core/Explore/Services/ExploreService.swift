//
//  ExploreService.swift
//  Airbnb clone
//
//  Created by Cristian David Laguna Aldana on 16/09/24.
//

import Foundation

class ExploreService {
    func fetchListing () async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
