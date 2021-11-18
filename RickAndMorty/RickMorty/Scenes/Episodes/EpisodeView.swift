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
                            
                            VStack(alignment: .leading, spacing:10) {
                                
                                Spacer()
                                
                                Text(episode.name)
                                    .foregroundColor(currentMode == .dark ? Color("LightBlue") : Color("NoBlack"))
                                
                                VStack(alignment: .leading) {
                                    
                                    Text(episode.episode)
                                    Text(episode.airDate)
                                    
                                }
                                .font(.footnote)
                                .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
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
                        
                        viewModel.getEpisode(page: 1)
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
