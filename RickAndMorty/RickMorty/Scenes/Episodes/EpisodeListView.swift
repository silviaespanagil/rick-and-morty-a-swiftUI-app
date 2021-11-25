//
//  EpisodeListView.swift
//  RickMorty
//
//  Created by Silvia España on 5/11/21.
//

import SwiftUI

struct EpisodeListView: View {
    
    @StateObject var viewModel: EpisodeListViewModel
    
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
                            
                            OtherCellView(name: episode.name,
                                          infoA: episode.episode,
                                          infoBName: "Air date",
                                          infoB: episode.airDate)
                        }
                        .onAppear {
                            
                            if episode == viewModel.episodes.last {
                                
                                viewModel.getEpisode(page: viewModel.currentPage)
                            }
                        }
                    }
                }
                .onAppear {
                    
                    if viewModel.episodes.isEmpty {
                        
                        viewModel.getEpisode(page: 1)
                    }
                }
            }
        }
    }
}

struct EpisodeListView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        EpisodeListView(viewModel: EpisodeListViewModel())
    }
}
