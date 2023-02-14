//
// Dynamic link navigationDestination for
// navigation with random selection
// Random Pick A - D
//  ForEach vs. List

import SwiftUI

struct Page7: View {
    @State private var navPath = NavigationPath()
    
    let selections = ["0-A","1-B","2-C","3-D"]
    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack {
                // Button does not appear if after List
                Button("Tap for random A-D") {
                    guard let sel = selections.randomElement() else { return }
                    // print does not show in preview
                    print("sel", sel)
                    navPath.append(sel)
                }
//                ForEach(selections, id: \.self) { str in
//                    NavigationLink(value: str) {
//                        Text( "Row "+str )
//                    }
//                }
                List(selections, id: \.self ) { str in
                    NavigationLink(value: str) {
                        Text( "Row "+str )
                    }
                }
            }
            .navigationTitle("Random Pick A-D")
            .navigationDestination(for: String.self) { str in
                Text("Detail \(str)")
            }
        }
    }
}

struct Page7_Previews: PreviewProvider {
    static var previews: some View {
        Page7()
    }
}
