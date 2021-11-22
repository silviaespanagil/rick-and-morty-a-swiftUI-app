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
    
    var currentPage = 1
    
    private var cancellable: AnyCancellable?
    
    // MARK: - Methods

    func getLocation(page: Int) {
        
        showProgressView = true
        
        cancellable = GetLocationUseCase().execute(page: page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    
                    self.currentPage += 1
                    
                    break
                    
                case .failure:
                    break
                }
                
            }, receiveValue: {(locations: [Location]) in
                
                self.locations.append(contentsOf: locations)
            })
    }
}
