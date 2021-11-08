//
//  CharacterCellView.swift
//  RickMorty
//
//  Created by Silvia España on 5/11/21.
//

import SwiftUI

struct CharacterCellView: View {
    
    @StateObject var viewModel: CharacterListViewModel
    
    var body: some View {
       
            NavigationView {
                
                ScrollView {
                    
                    ForEach(viewModel.characters) { character in
                    
                        
                        NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))){
                            
                            HStack {
                                
                                Image("")
                                    .renderImage(url: URL(string:character.image)!)
                                    .frame(width: 90, height: 90)
                                
                                VStack {
                                    
                                    Text(character.name)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text(character.status)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding()
                            } .buttonStyle(PlainButtonStyle())
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding()
                        .background(
                            Rectangle()
                                .fill(Color.white)
                                .shadow(color: Color("DeepBlue"), radius: 2, x: 0, y: 2)
                        )
                        Spacer()
                        
                    }
                }
                
            
        }
    }
}

struct CharacterCellView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCellView(viewModel: CharacterListViewModel())
    }
} 
