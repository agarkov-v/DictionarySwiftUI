//
//  TranslationCell.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 07.09.2021.
//

import SwiftUI

// MARK: Previews

#if DEBUG
struct TranslationCell_Previews: PreviewProvider {
    static var previews: some View {
        let mock = TranslationResponse.petMockData.definition.first!
        
        Group {
            TranslationCell(translation: mock)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
                .previewDisplayName("Defult")
            
            TranslationCell(translation: mock)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
        }
        
    }
}
#endif

// MARK: TranslationCell

struct TranslationCell: View {
    
    let translation: DefinitionItem
    
    var body: some View {
        HStack {
            let smallInset: CGFloat = 5
            let largeInset: CGFloat = 10
            Text("\(translation.text)")
                .frame(maxWidth: .infinity)
                .padding(
                    EdgeInsets(top: smallInset,
                               leading: largeInset,
                               bottom: smallInset,
                               trailing: smallInset)
                )
            
            Rectangle().fill(Color.gray).frame(width: 1)
            
            Text("\(translation.translations.first?.text ?? "NoTranslation")")
                .frame(maxWidth: .infinity)
                .padding(
                    EdgeInsets(top: smallInset,
                               leading: smallInset,
                               bottom: smallInset,
                               trailing: largeInset)
                )
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}
