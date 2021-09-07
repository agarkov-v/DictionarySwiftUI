////import SwiftUI
////
////struct User {
////    var username: String
////    var email: String
////
////    init(username: String,
////         email: String) {
////        self.username = username
////        self.email = email
////    }
////}
////
////struct ProfileEditingView: View {
////    @Binding var user: User
////
////    var body: some View {
////        VStack {
////            TextField("Username", text: $user.username)
////            TextField("Email", text: $user.email)
////        }
////        .padding()
////    }
////}
////
////struct ProfileView: View {
////    @State private var user = User(username: "username", email: "email")
////    @State private var isEditingViewShown = false
////
////    var body: some View {
////        VStack(alignment: .leading, spacing: 10) {
////            Text("Username: ")
////                .foregroundColor(.secondary)
////                + Text(user.username)
////            Text("Email: ")
////                .foregroundColor(.secondary)
////                + Text(user.email)
////            Button(
////                action: { self.isEditingViewShown = true },
////                label: { Text("Edit") }
////            )
////        }
////        .padding()
////        .sheet(isPresented: $isEditingViewShown) {
////            VStack {
////                ProfileEditingView(user: self.$user)
////                Button(
////                    action: { self.isEditingViewShown = false },
////                    label: { Text("Done") }
////                )
////            }
////        }
////    }
////}
//
//
//import SwiftUI
//import Combine
//
////class User: ObservableObject {
////    @Published var username: String
////    var email: String
////
////    init(username: String,
////         email: String) {
////        self.username = username
////        self.email = email
////    }
////}
////
////struct ProfileEditingView: View {
//////    @ObservedObject var user: User
////    @EnvironmentObject var user: User
////
////    var body: some View {
////        VStack {
////            TextField("Username", text: $user.username)
////            TextField("Email", text: $user.email)
////        }
////        .padding()
////    }
////}
////
////struct ProfileView: View {
////    @StateObject private var user = User(username: "username",
////                                         email: "email")
////    @State private var isEditingViewShown = false
////
////    var body: some View {
////        VStack(alignment: .leading, spacing: 10) {
////            Text("Username: ")
////                .foregroundColor(.secondary)
////                + Text(user.username)
////            Text("Email: ")
////                .foregroundColor(.secondary)
////                + Text(user.email)
////            Button(
////                action: { self.isEditingViewShown = true },
////                label: { Text("Edit") }
////            )
////        }
////        .padding()
////        .sheet(isPresented: $isEditingViewShown) {
////            VStack {
////                ProfileEditingView()
////                Button(
////                    action: { self.isEditingViewShown = false },
////                    label: { Text("Done") }
////                )
////            }
////            .environmentObject(user)
////        }
////    }
////}
//
//class GameSettings: ObservableObject {
//    @Published var score = 0
//}
//
//struct ScoreView: View {
//    @EnvironmentObject var settings: GameSettings
//
//    var body: some View {
//        Text("Score: \(settings.score)")
//    }
//}
//
//struct ContentView: View {
//    @StateObject var settings = GameSettings()
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                Button("Increase Score") {
//                    settings.score += 1
//                }
//
//                NavigationLink(destination: ScoreView()) {
//                    Text("Show Detail View")
//                }
//            }
//            .frame(height: 200)
//        }
//        .environmentObject(settings)
//    }
//}
