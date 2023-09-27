//
// Dynamic link navigationDestination for
// navigation with random selection
// Random Pick A - D
//  ForEach vs. List

import SwiftUI

struct NavPathRandomView: View {
    @State private var navPath = NavigationPath()
    
    let selections = ["0-A","1-B","2-C","3-D"]
    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack {
                // Button does not appear if after List
                Button("Tap for random A-D") {
                    guard let sel = selections.randomElement() else { return }
                    // Select Previews at bottom of Debug Area to see print output
                    print("sel", sel)
                    navPath.append(sel)
                }
                List(selections, id: \.self ) { str in
                    NavigationLink(value: str) {
                        Text( "Row "+str )
                    }
                }
            }
            .navigationTitle("NavPathRandomView")
            .navigationDestination(for: String.self) { str in
                Text("Detail \(str)")
            }
        }
    }
}

struct Page7_Previews: PreviewProvider {
    static var previews: some View {
        NavPathRandomView()
    }
}
