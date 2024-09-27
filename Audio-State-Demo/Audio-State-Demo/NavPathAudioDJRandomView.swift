// Use AudioDJ to pick a audio to accompany view
// everytime view is created a new AudioDJ is created

import SwiftUI

struct NavPathAudioDJRandomView: View {
        
    @State private var navPath = NavigationPath()
    
    @EnvironmentObject var audioDJ:AudioDJ;

    let selections = ["0-A","1-B","2-C","3-D"]
    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack(spacing: 20) {
                Text("Row navigaion without associated action")
                ForEach(selections, id: \.self) { str in
                    NavigationLink(value: str) {
                        Text( "Row "+str )
                    }
                }
                Text("Button navigaion associated action")
                Button("Tap for random A-D") {
                    let index = Int.random(in:0..<selections.count)
                    let sel = selections[index];
                    choose( index )
                    navPath.append(sel)
                }
                .font(.title)
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

#Preview {
    NavigationView {
        NavPathAudioDJRandomView()
    }
    .environmentObject(AudioDJ())
}

//struct Page8_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            NavPathAudioDJRandomView()
//        }
//        .environmentObject(AudioDJ())
//    }
//}

// https://chatgpt.com/c/66f67050-4b18-8002-b1a4-b6856c90e1d7
// For SwiftUI for a Button how to increase text size
/*
 Button(action: {
    // Your action here
 }) {
    Text("Click Me")
        .font(.title) // Predefined title font size
 }
 */

