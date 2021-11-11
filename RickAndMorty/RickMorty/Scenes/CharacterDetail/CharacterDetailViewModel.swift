//
//  CharacterDetailViewModel.swift
//  RickMorty
//
//  Created by Silvia España on 8/11/21.
//

import Foundation
import Combine
import SwiftUI

class CharacterDetailViewModel: ObservableObject {
    
    @Published public private(set) var character: Character
    @Published public private(set) var showProgressView = false
    
    let location: String
    let gender: String
    let status: String
    let origin: String
    let species: String
    
    let imageSize: CGFloat = 250
    let cornerRadius: CGFloat = 24
    
    private var cancellable: AnyCancellable?
    
    init(character: Character) {
        
        self.character = character
        location = "Last known location:"
        gender = "Gender:"
        status = "Status:"
        origin = "Origin:"
        species = "Species:"
    }
    
    func getCharacterDetail() {
        
        showProgressView = true
        
        cancellable = GetCharacterDetailUseCase().execute(id: character.id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
                
            }, receiveValue: { (character: Character) in
                
                self.character = character
            })
    }
}
