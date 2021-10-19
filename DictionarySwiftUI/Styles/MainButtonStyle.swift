//
//  MainButtonStyle.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 19.10.2021.
//

import SwiftUI

struct MainButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .font(Font.body.bold())
            .padding(10)
            .padding(.horizontal, 20)
            .background(Color.mainButton.opacity(
                configuration.isPressed ? 0.5 : 1
            ))
            .cornerRadius(5)
    }
}
