//
//  TranslationCell.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 07.09.2021.
//

import SwiftUI

struct TranslationCell: View {
    let translation: TranslationResponse?
    
    var body: some View {
        ZStack {
            
        Group {
        HStack {
                Text("\(translation!.definition[0].text):")
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
//            Spacer()
//            Text("---")
//            Divider()
            Rectangle().fill(Color.gray).frame(width: 1)
//            Spacer()
                Text("\(translation!.definition[0].translations.first!.text)")
                    .frame(maxWidth: .infinity)
            }
        
            .fixedSize(horizontal: false, vertical: true)
        }
//        .padding()
        .background(Color.blue)
        .cornerRadius(10)
        .padding()
        .background(Color.yellow)
            
            Rectangle().fill(Color.green).frame(width: 1)
        }
        .fixedSize(horizontal: false, vertical: true)
    }
    
    private func layout() {
        
    }
}

struct TranslationCell_Previews: PreviewProvider {
    static var previews: some View {
        let mock = TranslationResponse.petMockData
        let size =  CGSize(width: 500, height: 100)
        Group {
            TranslationCell(translation: mock)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
//                .padding()
                .previewDisplayName("Defult")
            
            TranslationCell(translation: TranslationResponse.friendMockData)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
                .padding()
                .previewDisplayName("Dark Mode")
            
        }
        
        
        
    }
}
