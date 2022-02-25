// Random Pick A - D

import SwiftUI

struct Page5: View {
  @State private var selection: String? = nil
  let selections = "ABCD"
  var body: some View {
    // NavigationView {
    VStack {
      NavigationLink(destination: Text("View A"), tag: "A", selection: $selection) { EmptyView() }
      NavigationLink(destination: Text("View B"), tag: "B", selection: $selection) { EmptyView() }
      NavigationLink(destination: Text("View C"), tag: "C", selection: $selection) { EmptyView() }
      NavigationLink(destination: Text("View D"), tag: "D", selection: $selection) { EmptyView() }
      
      Button("Tap to show A-D") {
        let offset = Int.random(in: 0..<selections.count)
        let index = selections.index(selections.startIndex, offsetBy: offset)
        let char = selections[index]
        print("char", char)
        selection = String(char)
      }
      
    }
    .navigationTitle("Random Pick A-D")
  }
  // }
}

// print does not show in preview
// NavigationView already embeded in simultor

struct Page5_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Page5()
    }
  }
}
