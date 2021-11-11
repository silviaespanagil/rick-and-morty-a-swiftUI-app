//
//  LocationViewModel.swift
//  RickMorty
//
//  Created by Silvia España on 9/11/21.
//

import Foundation
import SwiftUI
import Combine

class LocationViewModel: ObservableObject {
    
    @Published public private(set) var locations: [Location] = []
    
    @Published public private(set) var showProgressView = false
    
    let dimension = "Dimension: "
    
    private var cancellable: AnyCancellable?
    
    init() {
        getLocation()
    }
    
    func getLocation() {
        
        showProgressView = true
        
        cancellable = GetLocationUseCase().execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
                
            }, receiveValue: {(locations: [Location]) in
                
                self.locations = locations
            })        
    }
}
