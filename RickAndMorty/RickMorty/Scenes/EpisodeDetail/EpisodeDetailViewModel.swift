//
//  EpisodeDetailViewModel.swift
//  RickMorty
//
//  Created by Silvia España on 16/11/21.
//

import Foundation
import Combine
import SwiftUI

class EpisodeDetailViewModel: ObservableObject {
    
    @Published public private(set) var episode: Episode
    @Published public private(set) var characters: [Character] = []
    @Published public private(set) var showProgressView = false
    
    private var charactersIds: [Int] = []
    
    private var cancellable: AnyCancellable?
    
    init(episode: Episode){
        
        self.episode = episode
        charactersIds = getCharactersID()
        self.getEpisodeDetail()
    }
    
    func getEpisodeDetail() {
        
        showProgressView = true
        
        cancellable = GetEpisodeDetailUseCase().execute(id: episode.id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
                
            }, receiveValue: { (episode: Episode) in
                
                self.episode = episode
            })
    }
    
    func getAllEpisodeCharactersById() {
        
        showProgressView = true
        
        cancellable = GetAllCharactersByIdUseCase().execute(ids: charactersIds)
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
    
    func getCharactersID() -> [Int] {
        
        var charactersIds: [Int] = []
        
        for character in episode.characters {
            
            let characterSplit = character.split(separator: "/")
            let characterId = (characterSplit.last! as NSString).integerValue
            
            charactersIds.append(characterId)

        }

        return charactersIds
    }
}
