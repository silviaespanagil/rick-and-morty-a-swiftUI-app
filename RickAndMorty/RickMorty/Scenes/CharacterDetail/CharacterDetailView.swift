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
        
        VStack {
            
            if viewModel.showProgressView {
                
                ProgressViewView()
            }
            
            Image("")
                .renderImage(url: URL(string:viewModel.character.image)!)
                .frame(width: viewModel.imageSize, height: viewModel.imageSize)
                .clipShape(RoundedRectangle(cornerRadius: viewModel.cornerRadius))
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
            Text(viewModel.character.name)
                .font(.title)
                .foregroundColor(Color("NoBlack"))
            
            Divider().frame(maxWidth: 240)
            
            Spacer(minLength: 10)
            
            VStack(spacing: 10) {
                
                HStack {
                    
                    Text(viewModel.gender)
                        .foregroundColor(Color("LightBlue"))
                        .font(.footnote)
                    
                    Spacer()
                    
                    VStack {
                        
                        Text(viewModel.character.gender)
                            .foregroundColor(Color("DeepBlue"))
                    }
                }.frame(maxWidth:.infinity)
                
                HStack {
                    
                    Text(viewModel.species)
                        .foregroundColor(Color("LightBlue"))
                        .font(.footnote)
                    
                    Spacer()
                    
                    VStack {
                        
                        Text(viewModel.character.species)
                            .foregroundColor(Color("DeepBlue"))
                    }
                }.frame(maxWidth:.infinity)
                
                HStack {
                    
                    Text(viewModel.status)
                        .foregroundColor(Color("LightBlue"))
                        .font(.footnote)
                    
                    Spacer()
                    
                    VStack {
                        
                        Text(viewModel.character.status)
                            .foregroundColor(Color("DeepBlue"))
                    }
                }.frame(maxWidth:.infinity)
                
                HStack {
                    
                    Text(viewModel.origin)
                        .foregroundColor(Color("LightBlue"))
                        .font(.footnote)
                    
                    Spacer()
                    
                    VStack {
                        
                        Text(viewModel.character.origin)
                            .foregroundColor(Color("DeepBlue"))
                    }
                }.frame(maxWidth:.infinity)
                
                HStack {
                    
                    Text(viewModel.location)
                        .foregroundColor(Color("LightBlue"))
                        .font(.footnote)
                    
                    Spacer()
                    
                    VStack {
                        
                        Text(viewModel.character.location)
                            .foregroundColor(Color("DeepBlue"))
                    }
                }.frame(maxWidth:.infinity)
            
                Spacer()
                
            }.padding()
        }.onAppear {
            
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
