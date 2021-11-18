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
            
            Image("")
                .renderImage(url: URL(string:viewModel.character.image)!)
                .frame(width: viewModel.imageSize, height: viewModel.imageSize)
                .clipShape(RoundedRectangle(cornerRadius: viewModel.cornerRadius))
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
            Text(viewModel.character.name)
                .font(.title)
                .foregroundColor(currentMode == .dark ? Color("Silver") : Color("NoBlack"))
            
            Divider().frame(maxWidth: 240)
            
            Spacer(minLength: 10)
            
            VStack(spacing: 10) {
                
                if viewModel.showProgressView {
                    
                    ProgressViewView()
                }
                
                HStack {
                    
                    Text(viewModel.gender)
                        .foregroundColor(Color("LightBlue"))
                        .font(.footnote)
                    
                    Spacer()
                    
                    VStack {
                        
                        if viewModel.character.gender == viewModel.unknownInfo {
                            
                            Text(viewModel.unknownString)
                                .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
                        } else {
                            
                            Text(viewModel.character.gender)
                                .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
                        }
                    }
                }.frame(maxWidth:.infinity)
                
                HStack {
                    
                    Text(viewModel.species)
                        .foregroundColor(Color("LightBlue"))
                        .font(.footnote)
                    
                    Spacer()
                    
                    VStack {
                        
                        Text(viewModel.character.species)
                            .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
                    }
                }.frame(maxWidth:.infinity)
                
                HStack {
                    
                    Text(viewModel.status)
                        .foregroundColor(Color("LightBlue"))
                        .font(.footnote)
                    
                    Spacer()
                    
                    VStack {
                        
                        if viewModel.character.status == viewModel.unknownInfo {
                            
                            Text(viewModel.unknownString)
                                .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
                        } else {
                            
                            Text(viewModel.character.status)
                                .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
                        }
                    }
                }.frame(maxWidth:.infinity)
                
                HStack {
                    
                    Text(viewModel.origin)
                        .foregroundColor(Color("LightBlue"))
                        .font(.footnote)
                    
                    Spacer()
                    
                    VStack {
                        
                        if viewModel.character.origin == viewModel.unknownInfo {
                            
                            Text(viewModel.unknownString)
                                .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
                        } else {
                            
                            Text(viewModel.character.origin)
                                .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
                        }
                    }
                }.frame(maxWidth:.infinity)
                
                HStack {
                    
                    Text(viewModel.location)
                        .foregroundColor(Color("LightBlue"))
                        .font(.footnote)
                    
                    Spacer()
                    
                    VStack {
                        
                        if viewModel.character.location == viewModel.unknownInfo {
                            
                            Text(viewModel.unknownString)
                                .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
                        } else {
                            Text(viewModel.character.location)
                                .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
                        }
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
