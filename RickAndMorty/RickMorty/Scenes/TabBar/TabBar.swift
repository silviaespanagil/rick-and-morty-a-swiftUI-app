//
//  TabBar.swift
//  RickMorty
//
//  Created by Silvia España on 5/11/21.
//
import SwiftUI

struct TabBar: View {
    
    @State var activeTab: Tabs = Tabs.characters
    
    init() {
        
        tabBarAppearance()
    }
    
    var body: some View {
        
        NavigationView {
            
            TabView(selection: $activeTab){
                
                CharacterCellView(viewModel: CharacterListViewModel())
                    .tabItem{
                        Image(systemName: "person.2")
                        Text("Characters")
                    }
                    .tag(Tabs.characters)
                
                LocationView(viewModel: LocationViewModel())
                    .tabItem{
                        Image(systemName: "map")
                        Text("Locations")
                    }
                    .tag(Tabs.locations)
                
                EpisodeView(viewModel: EpisodeViewModel())
                    .tabItem{
                        Image(systemName: "tv")
                        Text("Episodes")
                    }
                    .tag(Tabs.episodes)
                
            }
            .navigationTitle(getTabBarTitle(for: activeTab))
            .navigationBarTitleDisplayMode(.large)
            .accentColor(Color("NeonGreen"))
        }
        
    }
    
    func getTabBarTitle(for tabItem: Tabs) -> String {
        
        switch tabItem {
        case .characters:
            return "Characters"
        case .locations:
            return "Locations"
        case .episodes:
            return "Episodes"
        }
    }
}

extension TabBar {
    
    func tabBarAppearance() {
        
        let appearance = UITabBar.appearance()
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor.init(named: "NoBlack")
        appearance.standardAppearance = tabBarAppearance
        appearance.unselectedItemTintColor = UIColor.init(named: "DeepBlue")
    }
}

struct TabBar_Previews: PreviewProvider {
    
    static var previews: some View {
        TabBar()
    }
}
