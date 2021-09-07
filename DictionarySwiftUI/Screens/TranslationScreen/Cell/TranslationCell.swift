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
//        VStack {
//            HStack {
//                Spacer()
//                Text("Слово")
//                    .padding(.leading, 10)
//                Spacer()
//                Text("Перевод")
//                Spacer()
//            }
//            .padding(.bottom, 10)
//
//            HStack {
//                Spacer()
//                Text("\(translation!.definition[0].text)")
//                    .padding(.leading, 10)
//                    .background(Color.red)
//
//                Spacer()
//                Text("--")
//                Spacer()
//                Text("\(translation!.definition[0].translations.first!.text)")
//                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
//                Spacer()
//            }
        //        }
        Group {
        HStack {
                Text("\(translation!.definition[0].text):")
                    .background(Color.red)
            Spacer()
//            Text("---")
            Divider()
            Spacer()
                Text("\(translation!.definition[0].translations.first!.text)")
            }
        
            .fixedSize(horizontal: false, vertical: true)
        }
//        .padding()
        .background(Color.blue)
        .cornerRadius(10)
        .padding()
        .background(Color.yellow)
        
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
