//
//  EpisodeViewModel.swift
//  RickMorty
//
//  Created by Silvia España on 9/11/21.
//

import Foundation
import SwiftUI
import Combine

class EpisodeViewModel: ObservableObject {
    
    @Published public private(set) var episodes: [Episode] = []
    
    @Published public private(set) var showProgressView = false
    
    private var cancellable: AnyCancellable?
    
    init() {
        getEpisode()
    }
    
    func getEpisode() {
       
        showProgressView = true
        
        cancellable = GetEpisodeUseCase().execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
            
                    break
                case .failure:
                    break
                }
                
            }, receiveValue: {(episodes: [Episode]) in
                
                self.episodes = episodes
            })
        
    }
    
}
