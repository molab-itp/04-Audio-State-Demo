// Using Timer to track time lapsed

import SwiftUI
import AVFoundation

let fps = 30.0
let secs = 1.0 / fps

struct Page3: View {
  @State private var soundFile = "scale-1.m4a"
  @State private var player: AVAudioPlayer? = nil
  @State private var startTime = -1.0
  @State private var lapse: Double = -1.0
  let timer = Timer.publish(every: secs, on: .main, in: .common).autoconnect()
  var body: some View {
    VStack {
      HStack {
        Button("Play") {
          player = loadBundleAudio(soundFile)
          player?.numberOfLoops = -1
          player?.play()
        }
        Button("Stop") {
          print("Button stop")
          player?.stop()
        }
      }
      if let player = player {
        Text("duration " + String(format: "%.1f", player.duration))
        Text("currentTime " + String(format: "%.1f", player.currentTime))
      }
      Text("lapse "+String(format: "%.1f", lapse))
      Button("Reset lapse") {
        startTime = Date().timeIntervalSinceReferenceDate
      }
    }
    .onReceive(timer) { input in
      // print("onReceive timer", input)
      // currentDate = input
      lapse = input.timeIntervalSinceReferenceDate - startTime
    }
    .onAppear {
       startTime = Date().timeIntervalSinceReferenceDate
    }
  }
}


struct Page3_Previews: PreviewProvider {
  static var previews: some View {
    Page3()
  }
}
