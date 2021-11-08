//
//  CharacterListViewModel.swift
//  RickMorty
//
//  Created by Silvia España on 5/11/21.
//

import Foundation
import SwiftUI
import Combine

class CharacterListViewModel: ObservableObject {
    
 
    @Published public private(set) var characters: [Character] = []
    
    @Published public private(set) var showProgressView = false
    
    let imageSize: CGFloat = 90
    
    private var cancellable: AnyCancellable?
    
    init() {
        getAllCharacters()
    }
    
    func getAllCharacters() {
       
        showProgressView = true
        
        cancellable = GetAllCharactesUseCase().execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
                
            }, receiveValue: {(characters: [Character]) in
                
                self.characters = characters
            })
        
    }
    
}
