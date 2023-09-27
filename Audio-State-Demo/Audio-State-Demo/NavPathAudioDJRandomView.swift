// Use AudioDJ to pick a audio to accompany view
// everytime view is created a new AudioDJ is created

import SwiftUI

struct NavPathAudioDJRandomView: View {
        
    @State private var navPath = NavigationPath()
    
    @StateObject var audioDJ = AudioDJ()

    let selections = ["0-A","1-B","2-C","3-D"]
    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack {
                ForEach(selections, id: \.self) { str in
                    NavigationLink(value: str) {
                        Text( "Row "+str )
                    }
                }
                Button("Tap for random A-D") {
                    let index = Int.random(in:0..<selections.count)
                    let sel = selections[index];
                    choose( index )
                    navPath.append(sel)
                }
                 Spacer()
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

struct Page8_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NavPathAudioDJRandomView()
        }
    }
}
