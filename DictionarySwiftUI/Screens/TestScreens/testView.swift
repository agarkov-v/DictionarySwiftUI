//
//  testView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 17.08.2021.
//

import SwiftUI

struct testView: View {
    var body: some View {
        
        NavigationView {
            let data = TranslationResponse.petMockData
            Text("\(data.definition[0].text) - \(data.definition[0].translations[0].text )")
            Text("Secondary")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
