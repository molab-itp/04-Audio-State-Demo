// Dynamic link example
// decoding the documentation, building on resource example

import SwiftUI

struct Page4: View {
  @State private var selection: String? = nil
  
  var body: some View {
    NavigationView {
      VStack {
        NavigationLink(destination: Text("View A"), tag: "A", selection: $selection) { EmptyView() }
        NavigationLink(destination: Text("View B"), tag: "B", selection: $selection) { EmptyView() }
        
        Button("Tap to show A") {
          selection = "A"
        }
        
        Button("Tap to show B") {
          selection = "B"
        }
      }
      .navigationTitle("Navigation")
    }
  }
}

struct Page4_Previews: PreviewProvider {
    static var previews: some View {
        Page4()
    }
}

// https://developer.apple.com/documentation/swiftui/navigationlink
// https://www.hackingwithswift.com/quick-start/Swiftui/how-to-use-programmatic-navigation-in-swiftui
