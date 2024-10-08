//
//  ListingDetailView.swift
//  Airbnb clone
//
//  Created by Cristian David Laguna Aldana on 27/05/24.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let listing: Listing
    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Listing) {
        self.listing = listing
        
        let region = MKCoordinateRegion(
            center:listing.city == "Los Angeles" ? .losAngeles : .miami
                /*CLLocationCoordinate2D(
                latitude: 25.7602,
                longitude: -80.1959)*/
            , span: MKCoordinateSpan(
                latitudeDelta: 0.1,
                longitudeDelta: 0.1
            )
        )
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCarousel(listing: listing)
                    .frame(height: 320)
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(.leading, 32)
                        .padding(.top, 50)
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(listing.title)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        
                        Text("\(listing.reating)")
                        
                        Text(" - ")
                        
                        Text("28 Reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.black)
                    
                    Text("\(listing.city), \(listing.state)")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            //Host info view
            HStack {
                VStack (alignment: .leading) {
                    Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    HStack (spacing: 2) {
                        Text("\(listing.numberOfGuests) guests -")
                        Text("\(listing.numberOfBedrooms) bedrooms -")
                        Text("\(listing.numberOfBeds) beds -")
                        Text("\(listing.numberOfBathRooms) baths ")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                Image(listing.ownerImageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            .padding()
            
            Divider()
            
            //Listing Features
            VStack (alignment: .leading, spacing: 16) {
                ForEach(listing.features) { feature in
                    HStack (spacing: 12) {
                        Image(systemName: feature.imageName)
                        
                        VStack (alignment: .leading) {
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                    }
                }
            }
            // .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            Divider()
            
            //Bedrooms section
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll sleep")
                    .font(.headline)
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 16) {
                        ForEach(1 ... listing.numberOfBedrooms, id: \.self) { bedroom in
                            VStack(alignment: .leading) {
                                Image(systemName: "bed.double")
                                
                                Text("Bedroom \(bedroom)")
                            }
                            .padding()
                            .frame(width: 132, height: 100, alignment: .leading)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
            
            Divider()
            
            //Listing amenities
            VStack (alignment: .leading, spacing: 16) {
                Text("What this place offers")
                    .font(.headline)
                
                ForEach(listing.amenities, id: \.self) { amenity in
                    HStack(spacing: 8) {
                        Image(systemName: amenity.imageName)
                            .frame(width: 32)
                        
                        Text(amenity.title)
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            //Map section
            VStack (alignment: .leading, spacing: 16) {
                Text("Where you'll be")
                    .font(.headline)
                
                Map(position: $cameraPosition)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack (alignment: .leading) {
                        Text("$\(listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("Oct 15 - 24")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                        
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Reserve")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[3])
}
