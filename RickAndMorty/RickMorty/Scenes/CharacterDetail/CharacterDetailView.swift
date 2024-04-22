//
//  CharacterDetailView.swift
//  RickMorty
//
//  Created by Silvia España on 8/11/21.
//

import SwiftUI

struct CharacterDetailView: View {
    
    @StateObject var viewModel: CharacterDetailViewModel
    
    @Environment(\.colorScheme) var currentMode
    
    var body: some View {
        
        VStack {
            
            RenderImage(imageUrlString: viewModel.character.image)
            
            Text(viewModel.character.name)
                .font(.title)
                .foregroundColor(currentMode == .dark ? Color("Silver") : Color("NoBlack"))
            
            Divider().frame(maxWidth: 240)
            
            Spacer(minLength: 10)
            
            VStack(spacing: 10) {
                
                if viewModel.showProgressView {
                    
                    ProgressViewView()
                }
                
                CharacterDetailItemView(title: viewModel.gender,
                                        value: viewModel.character.gender)
                    .frame(maxWidth:.infinity)
                
                CharacterDetailItemView(title: viewModel.species,
                                        value: viewModel.character.species)
                    .frame(maxWidth:.infinity)
                
                CharacterDetailItemView(title: viewModel.status,
                                        value: viewModel.character.status)
                    .frame(maxWidth:.infinity)
                
                CharacterDetailItemView(title: viewModel.origin,
                                        value: viewModel.character.origin)
                    .frame(maxWidth:.infinity)
                
                CharacterDetailItemView(title: viewModel.location,
                                        value: viewModel.character.location)
                    .frame(maxWidth:.infinity)
                
                Spacer()
            }
            .padding()
        }
        .onAppear {
            
            viewModel.getCharacterDetail()
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let character = Character(id: 1,
                                  name: "Rick",
                                  status: "Alive",
                                  species: "Human",
                                  type: "Ni idea",
                                  gender: "Male",
                                  origin: "No se",
                                  location: "Earth",
                                  image: "https://pbs.twimg.com/profile_banners/729468343/1620046601/1500x500",
                                  url:"",
                                  episode:[""])
        
        CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))
    }
}
