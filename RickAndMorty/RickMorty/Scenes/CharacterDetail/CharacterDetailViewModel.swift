//
//  CharacterDetailViewModel.swift
//  RickMorty
//
//  Created by Silvia España on 8/11/21.
//

import Foundation
import Combine

class CharacterDetailViewModel: ObservableObject {
    
    
    @Published public private(set) var character: Character
    
    @Published public private(set) var showProgressView = false
    
    private var cancellable: AnyCancellable?
    
    init(character: Character) {
        
        self.character = character
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


