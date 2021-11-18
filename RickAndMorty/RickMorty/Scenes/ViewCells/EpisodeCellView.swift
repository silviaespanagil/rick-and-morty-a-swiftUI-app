//
//  EpisodeCellView.swift
//  RickMorty
//
//  Created by Silvia España on 18/11/21.
//

import SwiftUI

struct EpisodeCellView: View {
    
    @Environment(\.colorScheme) var currentMode
    
    let spacing: CGFloat = 10
    
    var name: String
    var episode: String
    var airDate: String
    
    init(name: String, episode: String, airDate: String) {
        
        self.name = name
        self.episode = episode
        self.airDate = airDate
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: spacing) {
            
            Spacer()
            
            Text(name)
                .foregroundColor(currentMode == .dark ? Color("LightBlue") : Color("NoBlack"))
            
            VStack(alignment: .leading) {
                
                Text(episode)
                Text(airDate)
                
            }
            .font(.footnote)
            .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
            Spacer()
        }
    }
}

struct EpisodeCellView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeCellView(
            name: "Episode",
            episode: "S34E12",
            airDate: "July 16")
    }
}
