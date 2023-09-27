//
// Dynamic link example
// decoding the documentation, building on resource example

import SwiftUI

struct NavLinkView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
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

struct Page5_Previews: PreviewProvider {
    static var previews: some View {
        NavLinkView()
    }
}

// https://developer.apple.com/documentation/swiftui/navigationlink
// https://www.hackingwithswift.com/quick-start/Swiftui/how-to-use-programmatic-navigation-in-swiftui
