//
//  MainView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 17.08.2021.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ContentView().tabItem { Label("menu", systemImage: "list.dash") }
            
            ContentView().tabItem { Label("2", systemImage: "circle") }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
