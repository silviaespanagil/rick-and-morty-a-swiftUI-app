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
                .font(.title)
                .foregroundColor(Color("NoBlack"))
            
            Divider().frame(maxWidth: 240)
            
            Spacer(minLength: 10)
            
            VStack(spacing: 20) {
                
                HStack {
                    
                    Text(viewModel.episodeSeasonIcon)
                        .font(.footnote)
                    Text(viewModel.episodeSeason)
                        .foregroundColor(Color("LightBlue"))
                        .font(.footnote)
                    
                    Spacer()
                    
                    VStack {
                        
                        Text("\(viewModel.episode.episode)")
                            .foregroundColor(Color("DeepBlue"))
                    }
                }.frame(maxWidth:.infinity)
                
                HStack {
                    
                    Text(viewModel.airDateIcon)
                        .font(.footnote)
                    Text(viewModel.airDate)
                        .foregroundColor(Color("LightBlue"))
                        .font(.footnote)
                    
                    Spacer()
                    
                    VStack {
                        
                        Text("\(viewModel.episode.airDate)")
                            .foregroundColor(Color("DeepBlue"))
                    }
                }.frame(maxWidth:.infinity)
                
                HStack {
                    
                    Text(viewModel.characterStarringIcon)
                        .font(.footnote)
                    Text(viewModel.characterStarring)
                        .foregroundColor(Color("LightBlue"))
                        .font(.footnote)
                    
                    Spacer()
                    
                    VStack {
                        
                        Text("\(viewModel.characters.count)")
                            .foregroundColor(Color("DeepBlue"))
                    }
                }.frame(maxWidth:.infinity)
            }.padding()
            
            List {
                
                Section(header: Text("Characters")) {
                    
                    if viewModel.showProgressView {
                        
                        ProgressViewView()
                    }
                    
                    ForEach(viewModel.characters, id: \.self){ character in
                        
                        HStack{
                            
                            Image("")
                                .renderImage(url: URL(string: character.image)!)
                                .frame(width: viewModel.imageSize, height: viewModel.imageSize)
                                .clipShape(RoundedRectangle(cornerRadius: viewModel.cornerRadius))
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                            
                            Text(character.name)
                                .foregroundColor(Color("NoBlack"))
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                
                                Text("\(viewModel.episodeDetail) \(character.episode.count) \(viewModel.episodeString)")
                                
                                Divider().frame(maxWidth: 40)
                                
                                Text("\(viewModel.currentStatus) \(character.status)")
                            }.font(.footnote)
                                .foregroundColor(Color("DeepBlue")).multilineTextAlignment(.trailing)
                        }.frame(maxWidth:.infinity)
                            .padding(5)
                    }
                }
            }.frame(maxWidth:.infinity)
                .listStyle(.grouped)
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
