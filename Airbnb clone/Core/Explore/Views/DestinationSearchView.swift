//
//  DestinationSearchView.swift
//  Airbnb clone
//
//  Created by Cristian David Laguna Aldana on 4/08/24.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    
    @Binding var show: Bool
    @ObservedObject var viewModel: ExploreViewModel
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numberOfGuests = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Button {
                    withAnimation(.snappy){
                        viewModel.updateListingForLocation()
                        show.toggle()
                    }
                }label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                if !viewModel.searchLocation.isEmpty {
                    Button("Clear") {
                        viewModel.searchLocation = ""
                        viewModel.updateListingForLocation()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            VStack(alignment: .leading){
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destination", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingForLocation()
                                show.toggle()
                            }
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4 ))
                    }
                } else {
                    CollapsedPickerView(title: "Where", description: "Add destination")
                }
                
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .location}
            }
            
            // date selection view
            VStack(alignment: .leading){
                if selectedOption == .dates {
                    Text("When's your trips?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .dates}
            }
            
            //num guests view
            VStack(alignment: .leading) {
                if selectedOption == .guests {
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numberOfGuests) Adults")
                    } onIncrement: {
                       numberOfGuests += 1
                    } onDecrement: {
                        guard numberOfGuests > 0 else {return}
                        numberOfGuests -= 1
                        //numberOfGuests = numberOfGuests == 0 ? 0 : numberOfGuests - 1
                    }
                    /*Spacer()
                    HStack {
                        Text("\(numberOfGuests) Adults")
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "plus")
                                .imageScale(.large)
                                .foregroundStyle(.black)
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "minus")
                                .imageScale(.large)
                                .foregroundStyle(.black)
                        })
                        
                    }*/
                    
                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .guests}
            }
            
            Spacer()
               
           
            
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false), viewModel: ExploreViewModel(service: ExploreService()))
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
    
    
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
        //.padding()
        //.background(.white)
        //.clipShape(RoundedRectangle(cornerRadius: 12))
        //.padding()
        //.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}
