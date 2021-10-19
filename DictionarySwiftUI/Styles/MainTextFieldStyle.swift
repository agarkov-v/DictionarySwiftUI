//
//  MainTextFieldStyle.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 19.10.2021.
//

import SwiftUI

struct MainTextFieldStyle: TextFieldStyle {
    
    var backroundColor: Color
    
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.all, 5)
            .background(backroundColor)
            .cornerRadius(5)
            
    }
    
    
}
