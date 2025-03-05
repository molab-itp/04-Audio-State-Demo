//
// Audio functions organized into class


import SwiftUI

struct PlayAudioDJView: View {
  @Environment(AudioDJ.self) var audioDJ;
  var body: some View {
    TimelineView(.animation) { context in
      VStack {
        if let player = audioDJ.player {
          ProgressView(
            value: player.currentTime, total: player.duration
          )
        }
        HStack {
          Button("Play") {
            audioDJ.play()
          }
          Button("Stop") {
            audioDJ.stop()
          }
          Button("Next") {
            audioDJ.next()
          }
        }
        Text("soundIndex \(audioDJ.soundIndex)")
        Text(audioDJ.soundFile)
        if let player = audioDJ.player {
          Text("duration " + String(format: "%.1f", player.duration))
          Text("currentTime " + String(format: "%.1f", player.currentTime))
        }
      }
    }
  }
}

#Preview {
  PlayAudioDJView()
    .environment(AudioDJ())
}

//struct Page4_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayAudioDJView()
//            .environmentObject(AudioDJ())
//    }
//}
//
