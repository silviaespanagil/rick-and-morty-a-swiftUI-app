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
    @Published public private(set) var characters: [Character] = []
    @Published public private(set) var showProgressView = false
    
    private var residentIds: [Int] = []
    
    private var cancellable: AnyCancellable?
    
    let typeIcon: String
    let type: String
    let dimensionIcon: String
    let dimension: String
    let bornIn: String
    let lastSeen: String
    let residents: String
    
    let unknownInfo: String
    let unknownString: String
    
    let imageSize: CGFloat = 50
    let cornerRadius: CGFloat = 50
    
    init(location: Location) {

        typeIcon = "🪐"
        type = "Type"
        dimensionIcon = "🚀"
        dimension = "Dimension"
        bornIn = "Born in"
        lastSeen = "Last seen in"
        residents = "Residents"
        
        unknownInfo = "unknown"
        unknownString = "Unknown"
        
        self.location = location
        residentIds = getResidentsID()
        self.getLocationDetail()
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
    
    func getAllCharactersById() {
        
        showProgressView = true
        
        cancellable = GetAllCharactersByIdUseCase().execute(ids: residentIds)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
                
            }, receiveValue: { (characters: [Character]) in
                
                self.characters = characters
            })
    }
    
    func getResidentsID() -> [Int] {
        
        var residentIds: [Int] = []
        
        for resident in location.residents {
            
            let residentSplit = resident.split(separator: "/")
            let residentID = (residentSplit.last! as NSString).integerValue
            
            residentIds.append(residentID)
        }
        
        return residentIds
    }
}
