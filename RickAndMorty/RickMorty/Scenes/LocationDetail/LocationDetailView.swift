//
//  LocationDetailView.swift
//  RickMorty
//
//  Created by Silvia España on 12/11/21.
//

import SwiftUI

struct LocationDetailView: View {
    
    @StateObject var viewModel: LocationDetailViewModel
    
    var body: some View {
        
        VStack {
            
            Text(viewModel.location.name)
                .font(.title)
                .foregroundColor(Color("NoBlack"))
            
            Divider().frame(maxWidth: 240)
            
            Spacer(minLength: 10)
            
            VStack(spacing: 20) {
                
                HStack {
                    
                    Text(viewModel.typeIcon)
                        .font(.footnote)
                    Text(viewModel.type)
                        .foregroundColor(Color("LightBlue"))
                        .font(.footnote)
                    
                    Spacer()
                    
                    VStack {
                        
                        Text("\(viewModel.location.type)")
                            .foregroundColor(Color("DeepBlue"))
                    }
                }.frame(maxWidth:.infinity)
                
                HStack {
                    
                    Text(viewModel.dimensionIcon)
                        .font(.footnote)
                    Text(viewModel.dimension)
                        .foregroundColor(Color("LightBlue"))
                        .font(.footnote)
                    
                    Spacer()
                    
                    VStack {
                        
                        Text("\(viewModel.location.dimension)")
                            .foregroundColor(Color("DeepBlue"))
                    }
                }.frame(maxWidth:.infinity)
            }.padding()
            
            List {
                
                Section(header: Text(viewModel.residents)) {
                    
                    if viewModel.showProgressView {
                        
                        ProgressViewView()
                    }
                    
                    ForEach(viewModel.characters, id: \.self){ character in
                        
                        HStack {
                            
                            Image("")
                                .renderImage(url: URL(string: character.image)!)
                                .frame(width: viewModel.imageSize, height: viewModel.imageSize)
                                .clipShape(RoundedRectangle(cornerRadius: viewModel.cornerRadius))
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                            
                            Text(character.name)
                                .foregroundColor(Color("NoBlack"))
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                
                                Text("\(viewModel.bornIn) \(character.origin)")
                                
                                Divider().frame(maxWidth: 40)
                                
                                Text(viewModel.lastSeen)
                                Text("\(character.location)")}.font(.footnote)
                                .foregroundColor(Color("DeepBlue")).multilineTextAlignment(.trailing)
                        }.frame(maxWidth:.infinity)
                            .padding(5)
                    }
                }
            }.frame(maxWidth:.infinity)
                .listStyle(.grouped)
            
        }.onAppear {
            
            viewModel.getAllCharactersById()
        }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let location = Location(id: 1,
                                name: "Earth",
                                type: "Planet",
                                residents: ["1","2"],
                                dimension: "Dimension")
        
        LocationDetailView(viewModel:LocationDetailViewModel(location: location))
    }
}
