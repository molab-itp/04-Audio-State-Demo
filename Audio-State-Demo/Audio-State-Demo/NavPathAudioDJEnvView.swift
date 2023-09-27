// Use AudioDJ from environment
// ensure only one instance for the app

import SwiftUI

struct NavPathAudioDJEnvView: View {
    
    @State private var navPath = NavigationPath()
    
    @EnvironmentObject var audioDJ:AudioDJ
    
    let selections = ["0-A","1-B","2-C","3-D"]

    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack {
                ForEach(selections, id: \.self) { str in
                    NavigationLink(value: str) {
                        EmptyView()
                    }
                }
                Button("Tap for random A-D") {
                    let index = Int.random(in:0..<selections.count)
                    let sel = selections[index];
                    choose( index )
                    navPath.append(sel)
                }
            }
            .navigationTitle("NavPathAudioDJEnvView")
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

struct Page9_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NavPathAudioDJEnvView()
                .environmentObject(AudioDJ())
        }
    }
}
