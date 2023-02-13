//
// Dynamic link navigationDestination for
// navigation with random selection
// Random Pick A - D
//  ForEach vs. List

import SwiftUI

struct Page6: View {
    @State private var navPath = NavigationPath()
    
    let selections = ["A","B","C","D"]
    
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

struct Page6_Previews: PreviewProvider {
    static var previews: some View {
        Page6()
    }
}
