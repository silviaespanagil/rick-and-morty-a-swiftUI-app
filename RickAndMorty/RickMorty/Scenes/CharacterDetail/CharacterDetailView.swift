//
//  CharacterDetailView.swift
//  RickMorty
//
//  Created by Silvia España on 8/11/21.
//

import SwiftUI

struct CharacterDetailView: View {
    
    @StateObject var viewModel: CharacterDetailViewModel
    
    var body: some View {
        
        VStack{
            
            HStack{
                
                Image("")
                    .renderImage(url: URL(string:viewModel.character.image)!)
                    .frame(width: viewModel.imageSize, height: viewModel.imageSize)
                    .clipShape(RoundedRectangle(cornerRadius: viewModel.cornerRadius))
                
            }
            
            VStack(alignment: .leading, spacing:10){
                
                Text(viewModel.character.name)
                    .font(.title)
                Divider().frame(maxWidth: 240)
                Text("\(viewModel.location) \(viewModel.character.location)")
                Text("\(viewModel.gender) \(viewModel.character.gender)")
                Text("\(viewModel.status) \(viewModel.character.status)")
                Text("\(viewModel.origin) \(viewModel.character.origin)")
                Text("\(viewModel.species) \(viewModel.character.species)")
                Text(viewModel.character.type)
            }
            
        }.padding()
            .background(
                RoundedRectangle(cornerRadius: viewModel.cornerRadius)
                    .fill(Color.white)
                    .shadow(color: Color("DeepBlue"), radius: 2, x: 0, y: 2)
            )
        
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
