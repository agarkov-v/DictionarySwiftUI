//
//  View+DidLoad.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 07.10.2021.
//

import SwiftUI

extension View {

    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }
}
