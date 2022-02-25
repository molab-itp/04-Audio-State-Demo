// Audio bundled with app
// https://developer.apple.com/documentation/avfaudio/avaudioplayer
// @State to track variables that affect UI
// TimelineView for timer triggered updates
// Keep audio short

import SwiftUI
import AVFoundation

let bundleAudio = [
  "bbc-birds-1.m4a",
  "bbc-birds-2.m4a",
  "scale-1.m4a"
];

func loadBundleAudio(_ fileName:String) -> AVAudioPlayer? {
  let path = Bundle.main.path(forResource: fileName, ofType:nil)!
  let url = URL(fileURLWithPath: path)
  do {
    return try AVAudioPlayer(contentsOf: url)
  } catch {
    print("loadBundleAudio error", error)
  }
  return nil
}

struct Page1: View {
  @State private var soundIndex = 0
  @State private var soundFile = bundleAudio[0]
  @State private var player: AVAudioPlayer? = nil
  var body: some View {
    TimelineView(.animation) { context in
      VStack {
        HStack {
          Button("Play") {
            print("Button Play")
            player = loadBundleAudio(soundFile)
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
            soundIndex = (soundIndex+1) % bundleAudio.count
            soundFile = bundleAudio[soundIndex];
          }
        }
        Text("soundIndex \(soundIndex)")
        Text("soundFile \(soundFile)")
        if let player = player {
          Text("duration " + String(format: "%.1f", player.duration))
          Text("currentTime " + String(format: "%.1f", player.currentTime))
        }
      }
    }
  }
}

struct Page1_Previews: PreviewProvider {
  static var previews: some View {
    Page1()
  }
}

// https://developer.apple.com/documentation/swiftui/state

// Source for audio clips
// https://www.youraccompanist.com/free-scales-and-warm-ups/reference-scales
// Reference Scales_On A Flat-G Sharp.mp3
// https://sound-effects.bbcrewind.co.uk/search?cat=Animals
// https://file-examples.com/index.php/sample-audio-files/sample-mp3-download/
