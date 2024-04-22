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
    @Published internal var selectedStatus: CharacterStatus = .all
    
    var currentPage = 1
    
    private var cancellable: AnyCancellable?
    
    // MARK: - Methods
    
    func getAllCharacters(page: Int) {
        
        showProgressView = true
        
        cancellable = GetAllCharactersUseCase().execute(page: page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [self] completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    
                    self.currentPage += 1
                    
                    break
                    
                case .failure:
                    break
                }
                
            }, receiveValue: {(characters: [Character]) in
                
                self.characters.append(contentsOf: characters)
            })
    }
    
    internal var filteredCharacters: [Character] {
        
        if selectedStatus == .all {
            
            return characters
        } else {
            
            return characters.filter { $0.status == selectedStatus.rawValue }
        }
    }
}
