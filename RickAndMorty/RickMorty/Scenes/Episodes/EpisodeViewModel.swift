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
    
    var currentPage = 1
    
    private var cancellable: AnyCancellable?
    
    init(page: Int) {
        
        getEpisode(page: page)
    }
    
    func getEpisode(page: Int) {
       
        showProgressView = true
        
        cancellable = GetEpisodeUseCase().execute(page: page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    
                    self.currentPage += 1
                    
                    break
                    
                case .failure:
                    break
                }
                
            }, receiveValue: {(episodes: [Episode]) in
                
                self.episodes = episodes
            })
        
    }
    
}
