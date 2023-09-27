//
// Dynamic link navigationDestination(for
// decoding the documentation, building on resource example
// Navigation with Links and buttons

import SwiftUI

struct NavButtonView: View {
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
                NavigationLink(value: "C") {
                    Text("Row C")
                }
                
                Button("Tap for Detail A") {
                    navPath.append( "A" )
                }
                Button("Tap for Detail B") {
                    navPath.append( "B" )
                }
                Button("Tap for Detail C") {
                    navPath.append( "C" )
                }

                Spacer()
            }
            .navigationTitle("NavButtonView")
            .navigationDestination(for: String.self) { str in
                Text("Detail \(str)")
            }
        }
    }
}

struct Page6_Previews: PreviewProvider {
    static var previews: some View {
        NavButtonView()
    }
}


// https://developer.apple.com/documentation/swiftui/navigationlink
// https://www.hackingwithswift.com/quick-start/Swiftui/how-to-use-programmatic-navigation-in-swiftui
