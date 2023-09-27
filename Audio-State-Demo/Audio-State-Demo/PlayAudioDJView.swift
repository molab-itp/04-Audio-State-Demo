//
// Audio functions organized into class


import SwiftUI

struct PlayAudioDJView: View {
    @StateObject var audioDJ = AudioDJ()
    var body: some View {
        TimelineView(.animation) { context in
            VStack {
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

struct Page4_Previews: PreviewProvider {
    static var previews: some View {
        PlayAudioDJView()
    }
}

