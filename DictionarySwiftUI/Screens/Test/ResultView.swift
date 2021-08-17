//
//  ResultView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 17.08.2021.
//

import SwiftUI

struct ResultView: View {
    var choice: String

    var body: some View {
        Text("You chose \(choice)")
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(choice: "test choise")
    }
}
