//
//  EpisodeDetailView.swift
//  RickMorty
//
//  Created by Silvia España on 16/11/21.
//

import SwiftUI

struct EpisodeDetailView: View {
    
    @StateObject var viewModel: EpisodeDetailViewModel
    
    var body: some View {
        
        VStack {
            
            Text(viewModel.episode.name)
            
            ForEach(viewModel.characters, id: \.self){ character in
                
                Text(character.name)
                
            }
            
        }.onAppear {
            
            viewModel.getAllEpisodeCharactersById()
        }
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let episode = Episode(id: 1,
                              name: "Pilot",
                              episode: "S01E01",
                              airDate: "December 2, 2013",
                              characters: ["2", "35"])
        
        EpisodeDetailView(viewModel: EpisodeDetailViewModel(episode: episode))
    }
}
