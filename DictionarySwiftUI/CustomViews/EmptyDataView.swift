//
//  EmptyDataView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 18.10.2021.
//

import SwiftUI

// MARK: Previews

#if DEBUG
struct EmptyDataView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EmptyDataView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
                .previewDisplayName("Defult")
            
            EmptyDataView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
                .environment(\.locale, Locale.init(identifier: "ru"))
                .previewDisplayName("Dark Mode")
        }
    }
}
#endif

// MARK: EmptyDataView

struct EmptyDataView: View {
    
    var body: some View {
        Text("EmptyData")
            .multilineTextAlignment(.center)
    }
}


