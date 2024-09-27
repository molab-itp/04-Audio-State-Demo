//
// Dynamic link example
// decoding the documentation, building on resource example

import SwiftUI

struct NavLinkView: View {
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                NavigationLink(value: "A") {
                    Text("Row A")
                }
                NavigationLink(value: "B") {
                    Text("Row B")
                }
                NavigationLink(value: "C") {
                    Text("Row C")
                }
                Spacer()
            }
            .navigationTitle("NavLinkView")
            .navigationDestination(for: String.self) { str in
                Text("Detail \(str)")
            }
        }
    }
}

#Preview {
    NavLinkView()
}

// https://developer.apple.com/documentation/swiftui/navigationlink
// https://www.hackingwithswift.com/quick-start/Swiftui/how-to-use-programmatic-navigation-in-swiftui
