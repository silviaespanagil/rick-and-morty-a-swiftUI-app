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
        
        TabView(selection: $activeTab){
            
            CharacterListView(viewModel: CharacterListViewModel())
                .tabItem {
                    
                    Label(characterTab, systemImage: "person.2")
                }
                .tag(Tabs.characters)
            
            LocationListView(viewModel: LocationListViewModel())
                .tabItem {
                    
                    Label(locationTab, systemImage: "map")
                }
                .tag(Tabs.locations)
            
            EpisodeListView(viewModel: EpisodeListViewModel())
                .tabItem {
                    
                    Label(episodeTab, systemImage: "tv")
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

extension TabBar {
    
    func tabBarAppearance() {
        
        UITabBar.appearance().barTintColor = UIColor.init(named:"NoBlack")
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().unselectedItemTintColor = UIColor.init(named:"DeepBlue")
    }
}

struct TabBar_Previews: PreviewProvider {
    
    static var previews: some View {
        
        TabBar()
    }
}
