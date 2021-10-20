//
//  ContentView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 22.07.2021.
//

import SwiftUI
import Combine

class User: ObservableObject {
    @Published var score = 0
}

struct ChangeView: View {
    @ObservedObject var user: User

    var body: some View {
        VStack {
            Text("Score: \(user.score)")
            Button("Increase") {
                self.user.score += 1
            }
        }
    }
    
}

struct ContentView: View {
    @StateObject var user = User()

    var body: some View {
        
        NavigationView {
            VStack(spacing: 30) {
                Text("Score: \(user.score)")
                NavigationLink(destination: ChangeView(user: user)) {
                    Text("Show Detail View")
                }
            }
            .navigationTitle("Navigation")
            .navigationBarItems(
                    trailing:
                        HStack {
                            Button("Subtract 1") {
                                self.user.score -= 1
                            }
                            Button("Add 1") {
                                self.user.score += 1
                            }
                        }
                )
        }
        .environmentObject(user)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
