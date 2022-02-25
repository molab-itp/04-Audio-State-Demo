// Use AudioDJ from environment
// ensure only one instance for the app

import SwiftUI

struct Page7_env: View {
  @EnvironmentObject var audioDJ:AudioDJ
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
        choose( choice )
      }
      Text("last selection \(audioDJ.soundIndex)")
      Button("Stop") {
        audioDJ.stop()
      }
      List {
        Button("Play-0") { choose( 0 ) }
        Button("Play-1") { choose( 1 ) }
        Button("Play-2") { choose( 2 ) }
        Button("Play-3") { choose( 3 ) }
      }
    }
    .onAppear {
      print("Page7_env onAppear audioDJ.soundIndex", audioDJ.soundIndex)
      // selection = audioDJ.soundIndex
    }
    // .onDisappear { audioDJ.stop() }
    .navigationTitle("Random Pick 0 to 3")
  }
  
  func choose(_ choice:Int) {
    selection = choice
    audioDJ.choose( choice )
    audioDJ.play()
  }
}

struct Page7_env_Previews: PreviewProvider {
    static var previews: some View {
      NavigationView {
        Page7_env()
          .environmentObject(AudioDJ())
      }
    }
}
