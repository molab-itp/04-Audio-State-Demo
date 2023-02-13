//
// Dynamic link navigationDestination(for
// decoding the documentation, building on resource example
// Navigation with Links and buttons

import SwiftUI

struct Page5: View {
    @State private var navPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $navPath) {
            VStack {
                NavigationLink(value: "A") {
                    Text("Row A")
                }
                NavigationLink(value: "B") {
                    Text("Row B")
                }
                Button("Tap for Detail A") {
                    navPath.append( "A" )
                }

                Button("Tap for Detail B") {
                    navPath.append( "B" )
                }
            }
            .navigationTitle("Navigation")
            .navigationDestination(for: String.self) { str in
                Text("Detail \(str)")
            }
        }
    }
}

struct Page5_Previews: PreviewProvider {
    static var previews: some View {
        Page5()
    }
}


// https://developer.apple.com/documentation/swiftui/navigationlink
// https://www.hackingwithswift.com/quick-start/Swiftui/how-to-use-programmatic-navigation-in-swiftui
