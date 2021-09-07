//
//  MainView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 17.08.2021.
//

import SwiftUI

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

struct MainTabView: View {
    
    @State private var selectedTab: TabItems = .main

    var body: some View {
        TabView(selection: $selectedTab) {
//            ContentView().tabItem {
//                Label("menu", systemImage: "list.dash") }
//                .onTapGesture {
//                    selectedTab = .main
//                }
//                .tag(TabItems.main)
            
            testView().tabItem {
                Label("2", systemImage: "circle") }
                .onTapGesture {
                    selectedTab = .search
                }
                .tag(TabItems.search)
        }
        .accentColor(.yellow)
//        .onAppear() {
//            UITabBar.appearance().barTintColor = .red
//        }
    }
    
}

private extension MainTabView {
    private enum TabItems {
        case main
        case search
        case collection
        case other
    }
}
