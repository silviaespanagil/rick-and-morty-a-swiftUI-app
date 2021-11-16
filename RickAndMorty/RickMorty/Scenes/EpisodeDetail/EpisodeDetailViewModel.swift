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
    @Published public private(set) var showProgressView = false
    
    private var cancellable: AnyCancellable?
    
    init(episode: Episode){
        
        self.episode = episode
        
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
}
