//
//  MainNavigation.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 17.11.2021.
//

import Foundation

class MainNavigation: ObservableObject {
	@Published var needsNavigation = false
	@Published var selectedTab: TabItems = .favorite {
		didSet {
			guard oldValue == selectedTab else { return }
				needsNavigation.toggle()
		}
	}
}
