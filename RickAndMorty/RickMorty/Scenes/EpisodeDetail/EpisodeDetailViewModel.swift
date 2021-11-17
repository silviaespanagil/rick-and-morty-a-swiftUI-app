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
    
    let episodeSeasonIcon: String
    let episodeSeason: String
    let airDateIcon: String
    let airDate: String
    let characterStarringIcon: String
    let characterStarring: String
    let charactersTitle: String
    let episodeDetail: String
    let episodeString: String
    let currentStatus: String
    
    let imageSize: CGFloat = 50
    let cornerRadius: CGFloat = 50
    
    init(episode: Episode){
        
        episodeSeasonIcon = "📺"
        episodeSeason = "Episode"
        airDateIcon = "📆"
        airDate = "Air Date"
        characterStarringIcon = "🛸"
        characterStarring = "# characters starring"
        charactersTitle = "Characters"
        episodeDetail = "Been in"
        episodeString = "episodes"
        currentStatus = "Current status"
        
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
