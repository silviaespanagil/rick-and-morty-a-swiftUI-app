//
//  EpisodeCellView.swift
//  RickMorty
//
//  Created by Silvia España on 5/11/21.
//

import SwiftUI

struct EpisodeView: View {
    
    @StateObject var viewModel: EpisodeViewModel
    
    @Environment(\.colorScheme) var currentMode
    
    var body: some View {
        
        VStack{
            
            List {
                
                Section(header:ListHeaderView()) {
                    
                    
                    if viewModel.showProgressView {
                        
                        ProgressViewView()
                    }
                    
                    ForEach(viewModel.episodes) { episode in
                        
                        NavigationLink(destination: EpisodeDetailView(viewModel: EpisodeDetailViewModel(episode: episode))) {
                            
                            EpisodeCellView(name: episode.name, episode: episode.episode, airDate: episode.airDate)
                        }
                        .onAppear {
                            if episode == viewModel.episodes.last {
                                viewModel.getEpisode(page: viewModel.currentPage)
                            }
                        }
                    }
                }
                .onAppear {
                    
                    if viewModel.episodes.count < 1 {
                        
                        viewModel.getEpisode(page: 1)
                    }
                }
            }
        }
    }
}

struct EpisodeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        EpisodeView(viewModel: EpisodeViewModel())
    }
}
