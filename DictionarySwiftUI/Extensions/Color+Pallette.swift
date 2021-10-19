//
//  Color+Pallette.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 05.10.2021.
//

import SwiftUI

extension Color {
    
    static let background = Color(UIColor {
        return $0.userInterfaceStyle == .dark ? UIColor(hex: "#3F3F45") : UIColor(hex: "#F7F7F7")
    })
    
    static let cell = Color(UIColor {
        return $0.userInterfaceStyle == .dark ? UIColor(hex: "#353540") : UIColor(hex: "#e8e8e8")
    })
    
    static let bar = Color(UIColor {
        return $0.userInterfaceStyle == .dark ? UIColor(hex: "#2F2E32") : UIColor(hex: "#d1d1d3")
    })
    
    static let mainAccent = Color(UIColor {
        return $0.userInterfaceStyle == .dark ? UIColor(hex: "#f6fafb") : UIColor(hex: "#252b31")
    })
    
    static let mainButton = Color(UIColor {
        return $0.userInterfaceStyle == .dark ? UIColor(hex: "#495057") : UIColor(hex: "#adb5bd")
    })
}
