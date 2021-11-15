//
//  LocationDetailViewModel.swift
//  RickMorty
//
//  Created by Silvia España on 12/11/21.
//

import Foundation
import Combine
import SwiftUI

class LocationDetailViewModel: ObservableObject {
    
    @Published public private(set) var locations: [Location] = []
    
    @Published public private(set) var residents: [String] = []
    
    @Published public private(set) var residentID: Int = 0
    
    @Published public private(set) var showProgressView = false
    
    private var cancellable: AnyCancellable?
    
    init() {
        getLocation()
        getResidents()
    }
    
    //Get all locations
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
    
    func getResidents() {
        
        for location in locations {
            
            residents.append(contentsOf: location.residents)
            print (residents)
            
        }
    }
}
