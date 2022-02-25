// Audio loaded from url

import SwiftUI
import AVFoundation

func loadUrlAudio(_ urlString:String) -> AVAudioPlayer? {
  let url = URL(string: urlString)
  do {
    let data = try Data(contentsOf: url!)
    return try AVAudioPlayer(data: data)
  } catch {
    print("loadUrlSound error", error)
  }
  return nil
}

let urlSounds = [
  "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3",
  "https://www.youraccompanist.com/images/stories/Reference%20Scales_On%20A%20Flat-G%20Sharp.mp3",
  "https://www.youraccompanist.com/images/stories/Reference%20Scales_Pentatonic%20on%20F%20Sharp.mp3",
  "https://www.youraccompanist.com/images/stories/Reference%20Scales_Chromatic%20Scale%20On%20F%20Sharp.mp3",
]

struct Page2: View {
  @State private var soundIndex = 0
  @State private var soundFile = urlSounds[0]
  @State private var player: AVAudioPlayer? = nil
  var body: some View {
    TimelineView(.animation) { context in
      VStack {
        HStack {
          Button("Play") {
            print("Button Play")
            player = loadUrlAudio(soundFile)
            print("player", player as Any)
            // Loop indefinitely
            player?.numberOfLoops = -1
            player?.play()
          }
          Button("Stop") {
            print("Button Stop")
            player?.stop()
          }
          Button("Next") {
            soundIndex = (soundIndex+1) % urlSounds.count
            soundFile = urlSounds[soundIndex]
          }
        }
        Text("soundIndex \(soundIndex)")
        Text(soundFile)
        if let player = player {
          Text("duration " + String(format: "%.1f", player.duration))
          Text("currentTime " + String(format: "%.1f", player.currentTime))
        }
      }
    }
  }
}

struct Page2_Previews: PreviewProvider {
  static var previews: some View {
    Page2()
  }
}
