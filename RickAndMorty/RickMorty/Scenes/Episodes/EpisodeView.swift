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
        
        NavigationView{
            
            List {
                
                ForEach(viewModel.episodes) { episode in
                    
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
            }
        }
    }
}


struct EpisodeCellView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView(viewModel: EpisodeViewModel())
    }
}
