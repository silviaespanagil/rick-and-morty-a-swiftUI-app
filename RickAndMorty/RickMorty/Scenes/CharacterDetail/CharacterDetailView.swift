//
//  CharacterDetailView.swift
//  RickMorty
//
//  Created by Silvia España on 8/11/21.
//

import SwiftUI

// image, name, status, species, type, gender, origin location

struct CharacterDetailView: View {
    
    @StateObject var viewModel: CharacterDetailViewModel
    
    var body: some View {
        VStack{
            
            HStack{
                Image("")
                    .renderImage(url: URL(string:viewModel.character.image)!)
                    .frame(width: 250, height: 250)
                
            }
            Text(viewModel.character.name)
            Text(viewModel.character.status)
            Text(viewModel.character.species)
            Text(viewModel.character.type)
            Text(viewModel.character.gender)
            Text(viewModel.character.origin)
            Text(viewModel.character.location)
            
        }.padding()
          
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
                                  url:"")
        
        
        CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))
    }
}
