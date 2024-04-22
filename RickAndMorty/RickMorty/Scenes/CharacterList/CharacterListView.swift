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
            
            characterStatusFilter
            
            ScrollView {
                
                Section(header: ListHeaderView()) {
                    
                    if viewModel.showProgressView {
                        
                        ProgressViewView()
                    }
                    
                    ForEach(viewModel.filteredCharacters) { character in
                        
                        NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))) {
                            
                            CharacterCellView(image: character.image,
                                              name: character.name,
                                              status: character.status)
                        }
                        .onAppear {
                            if character == viewModel.characters.last {
                                viewModel.getAllCharacters(page: viewModel.currentPage)
                            }
                        }
                    }
                    .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
                }
                .onAppear {
                    
                    if viewModel.characters.isEmpty {
                        
                        viewModel.getAllCharacters(page: 1)
                    }
                }
            }
            Spacer()
        }.padding(.horizontal, 16)
    }
    
    @ViewBuilder
    var characterStatusFilter: some View {
        
        Text("Filter by status")
            .font(.caption)
            .frame(maxWidth: .infinity, alignment: .leading)
        
        Picker(selection: $viewModel.selectedStatus, label: Text("Status")) {
            
            ForEach(CharacterStatus.allCases, id: \.self) { status in
                
                Text(status.rawValue).tag(status)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 16)
    }
}
