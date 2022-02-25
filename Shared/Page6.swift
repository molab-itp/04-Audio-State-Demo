// Random Pick 0 to 3

import SwiftUI

struct Page6: View {
  @State private var selection: Int? = nil
  let views = ["View 0", "View 1", "View 2", "View 3"]
  var body: some View {
    VStack {
      NavigationLink(destination: Text(views[0]), tag: 0, selection: $selection) { EmptyView() }
      NavigationLink(destination: Text(views[1]), tag: 1, selection: $selection) { EmptyView() }
      NavigationLink(destination: Text(views[2]), tag: 2, selection: $selection) { EmptyView() }
      NavigationLink(destination: Text(views[3]), tag: 3, selection: $selection) { EmptyView() }
      Button("Tap to show 0 to 3") {
        let choice = Int.random(in: 0..<views.count)
        print("choice", choice)
        selection = choice
      }
      if let selection = selection {
        Text("last selection \(selection)")
      }
    }
    .navigationTitle("Random Pick 0 to 3")
  }
}

struct Page6_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Page6()
    }
  }
}
