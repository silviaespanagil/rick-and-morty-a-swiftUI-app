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
