//
//  TestView2.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 19.09.2021.
//

import SwiftUI

struct TestView2: View {
    @State private var isListShown: Bool = false
    @State private var fruits = ["Apple", "Orange", "Pineapple", "Grape"]
    @State private var selectedFruit: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                someAnotherView
                someAnotherView
                someAnotherView
                Spacer()
                Text(selectedFruit)
                Spacer().frame(height: 50)
            }
            
            VStack {
                button
                if isListShown {
                    fruitsList
                }
            }
        }
    }
    
    private var button: some View {
        Button(action: {
            withAnimation {
                isListShown.toggle()
            }
        }, label: {
            Text("Show list")
                .padding()
        })
        .background(Color.gray)
    }
    
    private var fruitsList: some View {
        VStack {
            ForEach(fruits, id: \.self) { fruit in
                Button(action: {
                    selectedFruit = fruit
                    isListShown = false
                }, label: {
                    Text(fruit)
                        .foregroundColor(.orange)
                })
            }
        }
        .padding()
        .background(Color.gray)
    }
    
    private var someAnotherView: some View {
        Rectangle()
            .foregroundColor(.red)
            .frame(width: UIScreen.main.bounds.width, height: 50)
    }
}


struct TestView2_Previews: PreviewProvider {
    static var previews: some View {
        TestView2()
    }
}
