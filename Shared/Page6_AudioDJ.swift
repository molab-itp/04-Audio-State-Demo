// Use AudioDJ to pick a audio to accompany view
// everytime view is created a new AudioDJ is created

import SwiftUI

struct Page6_AudioDJ: View {
    
    @StateObject var audioDJ = AudioDJ()
    
    @State private var navPath = NavigationPath()
    
    let selections = ["A","B","C","D"]
    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack {
                ForEach(selections, id: \.self) { str in
                    NavigationLink(value: str) {
                        Text( "Row "+str )
                    }
                }
                // Spacer()
                Button("Tap for random A-D") {
                    let index = Int.random(in:0..<selections.count)
                    let sel = selections[index];
                    choose( index )
                    navPath.append(sel)
                }
            }
            .navigationTitle("Random Pick A-D")
            .navigationDestination(for: String.self) { str in
                Text("Detail \(str)")
            }
            .onAppear {
                audioDJ.stop()
            }
        }
    }
    
    func choose(_ choice:Int) {
        audioDJ.choose( choice )
        audioDJ.play()
    }
}

struct Page6_AudioDJ_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Page6_AudioDJ()
        }
    }
}
