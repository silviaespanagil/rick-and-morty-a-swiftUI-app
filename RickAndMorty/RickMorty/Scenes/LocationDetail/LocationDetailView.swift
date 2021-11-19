//
//  LocationDetailView.swift
//  RickMorty
//
//  Created by Silvia España on 12/11/21.
//

import SwiftUI

struct LocationDetailView: View {
    
    @StateObject var viewModel: LocationDetailViewModel
    
    @Environment(\.colorScheme) var currentMode
    
    var body: some View {
        
        VStack {
            
            Text(viewModel.location.name)
                .font(.title)
                .foregroundColor(currentMode == .dark ? Color("Silver") : Color("NoBlack"))
            
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
                            .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
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
                        
                        if viewModel.location.dimension == viewModel.unknownInfo {
                            
                            Text(viewModel.unknownString)
                                .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
                        } else {
                            
                            Text("\(viewModel.location.dimension)")
                                .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
                        }
                    }
                }.frame(maxWidth:.infinity)
            }.padding()
            
            List {
                
                Section(header: Text(viewModel.residents)) {
                    
                    if viewModel.showProgressView {
                        
                        ProgressViewView()
                    }
                    
                    if viewModel.noResidents == true {
                        
                        VStack(spacing: 5) {
                            
                        Image(systemName: "exclamationmark.triangle")
                        Text("“Wubba lubba dub dub!”")
                                .font(.footnote)
                        Text("There are no residents in this \(viewModel.location.type)")
                            .font(.footnote)
                           } .foregroundColor(currentMode == .dark ? Color("DeepBlue") : Color("LightBlue"))
                        
                    } else {
                    
                    ForEach(viewModel.characters, id: \.self) { character in
                        
                        HStack {
                            
                            Image("")
                                .renderImage(url: URL(string: character.image)!)
                                .frame(width: viewModel.imageSize, height: viewModel.imageSize)
                                .clipShape(RoundedRectangle(cornerRadius: viewModel.cornerRadius))
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                            
                            Text(character.name)
                                .foregroundColor(currentMode == .dark ? Color("LightBlue") : Color("NoBlack"))
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                
                                if character.origin == viewModel.unknownInfo {
                                    
                                    Text("\(viewModel.bornIn) \(viewModel.unknownString)")
                                } else {
                                    
                                    Text("\(viewModel.bornIn) \(character.origin)")
                                }
                                
                                Divider().frame(maxWidth: 40)
                                
                                Text(viewModel.lastSeen)
                                if character.location == viewModel.unknownInfo {
                                    
                                    Text("\(character.location)")
                                } else {
                                    
                                Text("\(character.location)")
                                }
        
                            }.font(.footnote)
                                .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue")).multilineTextAlignment(.trailing)
                        }.frame(maxWidth:.infinity)
                            .padding(5)
                    }
                }
            }.frame(maxWidth:.infinity)
                .listStyle(.grouped)
            
        }.onAppear {
            
            viewModel.getLocationDetail()
        }
    }}
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
