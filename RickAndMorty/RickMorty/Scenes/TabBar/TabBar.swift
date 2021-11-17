//
//  TabBar.swift
//  RickMorty
//
//  Created by Silvia España on 5/11/21.
//
import SwiftUI

struct TabBar: View {
    
    @State var activeTab: Tabs = Tabs.characters
    
    let characterTab: String
    let locationTab: String
    let episodeTab: String
    
    init() {
        
        characterTab = "Characters"
        locationTab = "Locations"
        episodeTab = "Episodes"
        
        tabBarAppearance()
    }
    
    var body: some View {
        
        NavigationView {
            
            TabView(selection: $activeTab){
                
                CharacterCellView(viewModel: CharacterListViewModel(page: 1))
                    .tabItem{
                        Image(systemName: "person.2")
                        Text(characterTab)
                    }
                    .tag(Tabs.characters)
                
                LocationView(viewModel: LocationViewModel(page: 1))
                    .tabItem{
                        Image(systemName: "map")
                        Text(locationTab)
                    }
                    .tag(Tabs.locations)
                
                EpisodeView(viewModel: EpisodeViewModel(page: 1))
                    .tabItem{
                        Image(systemName: "tv")
                        Text(episodeTab)
                    }
                    .tag(Tabs.episodes)
                
            }
            .navigationBarTitle(getTabBarTitle(for: activeTab))
            .navigationBarTitleDisplayMode(.inline)
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
