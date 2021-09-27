//
//  TranslationCell.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 07.09.2021.
//

import SwiftUI

// MARK: Previews

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

// MARK: TranslationCell

struct TranslationCell: View {
    
    let translation: DefinitionItem

    var body: some View {
        HStack {
            Text("\(translation.text)")
                .frame(maxWidth: .infinity)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 5))
            
            Rectangle().fill(Color.gray).frame(width: 1)
            
            Text("\(translation.translations.first?.text ?? "NoTranslation")")
                .frame(maxWidth: .infinity)
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 10))
        }
        
        .fixedSize(horizontal: false, vertical: true)
    }
}
