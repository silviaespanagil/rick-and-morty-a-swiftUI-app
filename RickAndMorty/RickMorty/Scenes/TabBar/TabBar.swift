//
//  TabBar.swift
//  RickMorty
//
//  Created by Silvia España on 5/11/21.
//

import SwiftUI

struct TabBar: View {

    init() {
        
        tabBarAppearance()
    }
    
    var body: some View {
        
        TabView(){
            
            CharacterCellView(viewModel: CharacterListViewModel())
                .tabItem{
                    Image(systemName: "person.2")
                    Text("Characters")
                }
            
            LocationCellView()
                .tabItem{
                    Image(systemName: "map")
                    Text("Locations")
                }
            
            EpisodeCellView()
                .tabItem{
                    Image(systemName: "tv")
                    Text("Episodes")
                }
        }.accentColor(Color("NeonGreen"))
           
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

extension TabBar {
    
    func tabBarAppearance() {
        
        UITabBar.appearance().backgroundColor = UIColor.init(named: "NoBlack")
        UITabBar.appearance().unselectedItemTintColor = UIColor.init(named: "DeepBlue")
    }
}
