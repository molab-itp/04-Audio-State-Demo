//
// Dynamic link example
// decoding the documentation, building on resource example

import SwiftUI

struct Page5: View {
    @State private var selection: String? = nil
    
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
