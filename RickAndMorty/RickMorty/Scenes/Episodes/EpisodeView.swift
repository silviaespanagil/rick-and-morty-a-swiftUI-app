//
//  EpisodeCellView.swift
//  RickMorty
//
//  Created by Silvia España on 5/11/21.
//

import SwiftUI

struct EpisodeView: View {
    
    @StateObject var viewModel: EpisodeViewModel
    
    var body: some View {
        
        VStack{
            
            List {
                
                Section(header:ListHeaderView()) {
                    
                    
                    if viewModel.showProgressView {
                        
                        ProgressViewView()
                    }
                    
                    ForEach(viewModel.episodes) { episode in
                        
                        NavigationLink(destination: EpisodeDetailView(viewModel: EpisodeDetailViewModel(episode: episode))) {
                            
                            VStack(alignment: .leading, spacing:10) {
                                
                                Spacer()
                                
                                Text(episode.name)
                                
                                VStack(alignment: .leading) {
                                    
                                    Text(episode.episode)
                                    Text(episode.airDate)
                                    
                                }
                                .font(.footnote)
                                Spacer()
                            }
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
                        
                        viewModel.getEpisode(page: viewModel.currentPage)
                    }
                }
            }
        }
    }
}

struct EpisodeCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        EpisodeView(viewModel: EpisodeViewModel())
    }
}
