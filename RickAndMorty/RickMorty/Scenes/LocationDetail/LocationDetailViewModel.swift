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
    
    @Published public private(set) var location: Location
    @Published public private(set) var residents: [String] = []
    @Published public private(set) var showProgressView = false
    
    private var cancellable: AnyCancellable?
    
    init(location: Location) {
        
        self.location = location
        getResidentsID()
    }
    
    func getLocationDetail() {
        
        showProgressView = true
        
        cancellable = GetLocationDetailUseCase().execute(id: location.id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
                
            }, receiveValue: { (location: Location) in
                
                self.location = location
                
            })
    }
    
    func getResidentsID() {
        
        residents.append(contentsOf: location.residents)
        print (residents)
        
        for resident in residents {
            
            let residentSplit = resident.split(separator: "/")
            let residentID = (residentSplit[4] as NSString).integerValue
            print(residentID)
        }
    }
    
}



