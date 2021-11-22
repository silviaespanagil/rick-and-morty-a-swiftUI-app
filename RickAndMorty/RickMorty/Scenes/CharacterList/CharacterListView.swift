//
//  CharacterCellView.swift
//  RickMorty
//
//  Created by Silvia España on 5/11/21.
//

import SwiftUI

struct CharacterListView: View {
    
    @StateObject var viewModel: CharacterListViewModel
    
    @Environment(\.colorScheme) var currentMode
    
    var body: some View {
        
        VStack {
            
            List {
                
                Section(header: ListHeaderView()) {
                    
                    if viewModel.showProgressView {
                        
                        ProgressViewView()
                    }
                    
                    ForEach(viewModel.characters) { character in
                        
                        NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))){
                            
                            CharacterCellView(image: character.image,
                                              name: character.name,
                                              status: character.status)
                        }
                        .onAppear {
                            
                            if character == viewModel.characters.last {
                                
                                viewModel.getAllCharacters(page: viewModel.currentPage)
                            }
                        }
                    }.padding()
                        .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
                    
                    Spacer()
                }
                .onAppear {
                    
                    if viewModel.characters.count < 1 {
                        
                        viewModel.getAllCharacters(page: 1)
                    }
                }
            }
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CharacterListView(viewModel: CharacterListViewModel())
    }
} 
