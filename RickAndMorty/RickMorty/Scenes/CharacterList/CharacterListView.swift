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
            
            content
        }.task {
            
            if viewModel.characters.isEmpty {
                
                viewModel.getAllCharacters(page: 1)
            }
        }
    }
    
    @ViewBuilder
    var content: some View {
        
        switch viewModel.state {
        case .loading:
            loadingView
        case .loaded:
            loadedView
        case .failed:
            errorView
        }
    }
    
    @ViewBuilder
    var loadingView: some View {
        
        ProgressViewView()
        
        Text ("Loading new characters")
            .font(.caption)
    }
    
    @ViewBuilder
    var loadedView: some View {
        
        characterStatusFilter
        
        characterListView
    }
    
    @ViewBuilder
    var errorView: some View {
        
        RenderImage(imageUrlString: "noImageAvailable", width: 250, height: 250)
        Text("Ops, there are some errors in this galaxy")
        Button(action: { viewModel.getAllCharacters(page: viewModel.currentPage) }, label: { Text("Try again")})
    }
    
    @ViewBuilder
    var characterListView: some View {
        
        List {
            
            Section(header: ListHeaderView()) {
                
                ForEach(viewModel.filteredCharacters) { character in
                    
                    NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))) {
                        
                        CharacterCellView(image: character.image,
                                          name: character.name,
                                          status: character.status)
                    }
                    .onAppear {
                        
                        if viewModel.shouldLoadMoreCharacters(currentCharacter: character) {
                            
                            viewModel.getAllCharacters(page: viewModel.currentPage)
                        }
                    }
                }.foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
                
                loadingView
            }
        }
    }
    
    @ViewBuilder
    var characterStatusFilter: some View {
        
        VStack {
            
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
        }.padding(.horizontal, 16)
    }
}
