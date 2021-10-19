//
//  MainView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 17.08.2021.
//

import SwiftUI

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainTabView()
                .preferredColorScheme(.light)
                .previewDisplayName("Defult")
            
            MainTabView()
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
#endif

struct MainTabView: View {
    
    // MARK: - Init
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.bar)
    }
    
    // MARK: - Body
    
    var body: some View {
        TabView(selection: $selectedTab) {
            translationView
            gameView
        }
        .accentColor(Color.mainAccent)
    }
    
    // MARK: - Private Properties
    
    @State private var selectedTab: TabItems = .main
    
    private var translationView: some View {
        
        return TranslationView()
            .tabItem {
                Label(
                    "search",
                    systemImage: "magnifyingglass"
                )
            }
            .onTapGesture {
                selectedTab = .main
            }
            .tag(TabItems.main)
    }
    
    private var gameView: some View {
        
        return GameView()
            .tabItem {
                Label(
                    "game",
                    systemImage: "gamecontroller"
                )
            }
            .onTapGesture {
                selectedTab = .game
            }
            .tag(TabItems.game)
    }
    
    
    
}

//MARK: - TabItems

private extension MainTabView {
    private enum TabItems {
        case main
        case game
    }
}
