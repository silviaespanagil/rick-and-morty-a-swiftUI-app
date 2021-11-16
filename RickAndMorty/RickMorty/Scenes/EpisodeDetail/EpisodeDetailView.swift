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
        
        Text(viewModel.episode.name)
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let episode = Episode(id: 1,
                              name: "Pilot",
                              episode: "S01E01",
                              airDate: "December 2, 2013",
                              characters: ["https://rickandmortyapi.com/api/character/1","https://rickandmortyapi.com/api/character/2","https://rickandmortyapi.com/api/character/35"])
        
        EpisodeDetailView(viewModel: EpisodeDetailViewModel(episode: episode))
    }
}
