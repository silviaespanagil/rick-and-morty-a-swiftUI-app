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
        
        if viewModel.showProgressView {
            
            ProgressViewView()
        }
        
        VStack{
            
            List {
                
                Section(header:ListHeaderView()) {
                    
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
            }
        }
    }
}

struct EpisodeCellView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView(viewModel: EpisodeViewModel(page: 1))
    }
}
