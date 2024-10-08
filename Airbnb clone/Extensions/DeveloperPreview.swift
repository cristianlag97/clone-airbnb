//
//  DeveloperPreview.swift
//  Airbnb clone
//
//  Created by Cristian David Laguna Aldana on 15/09/24.
//

import Foundation

class DeveloperPreview {
    
    static let shared = DeveloperPreview()

    var listings: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Jhon Smith",
            ownerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathRooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7850,
            longitude: -80.1936,
            imageUrls: ["listing-2", "listing-1", "listing-3", "listing-4"],
            address: "124 Main St",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa",
            reating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Jhon Smith",
            ownerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathRooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 34.05895967205184,
            longitude: -118.24355110315724,
            imageUrls: ["listing-4", "listing-1", "listing-3", "listing-2"],
            address: "124 Main St",
            city: "Los angeles",
            state: "California",
            title: "Los angeles de California",
            reating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony],
            type: .house
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Harry Style",
            ownerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathRooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 763,
            latitude: 34.05895967205184,
            longitude: -118.24355110315724,
            imageUrls: ["listing-8", "listing-1", "listing-3", "listing-4"],
            address: "124 Main St",
            city: "Los Angeles",
            state: "California",
            title: "Los angeles de otro lado",
            reating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .pool],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Timothy Chelamet",
            ownerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathRooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 763,
            latitude: 34.1,
            longitude: -118.1426,
            imageUrls: ["listing-1", "listing-3", "listing-7", "listing-6"],
            address: "124 Main St",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa",
            reating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        )
    ]
}
