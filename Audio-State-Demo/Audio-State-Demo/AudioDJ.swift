//
//  AudioDJ.swift
//  Audio-State-Demo
//
//  Created by jht2 on 9/27/23.
//

import AVFoundation

@Observable
class AudioDJ {
  var soundIndex = 0
  var soundFile = audioRef[0]
  var player: AVAudioPlayer? = nil

  // class must have initializer
  init() {
    print("AudioDJ init")
  }

  func play() {
    player = loadAudio(soundFile)
    print("AudioDJ player", player as Any)
    // Loop indefinitely
    player?.numberOfLoops = -1
    player?.play()
  }

  func stop() {
    player?.stop()
  }

  func next() {
    let wasPlaying = player != nil
    stop()
    choose(soundIndex + 1)
    if wasPlaying {
      play()
    }
  }

  func choose(_ index: Int) {
    soundIndex = (index) % AudioDJ.audioRef.count
    soundFile = AudioDJ.audioRef[soundIndex]
  }

  func loadAudio(_ str: String) -> AVAudioPlayer? {
    if str.hasPrefix("https://") {
      return loadUrlAudio(str)
    }
    return loadBundleAudio(str)
  }

  func loadUrlAudio(_ urlString: String) -> AVAudioPlayer? {
    let url = URL(string: urlString)
    do {
      let data = try Data(contentsOf: url!)
      return try AVAudioPlayer(data: data)
    } catch {
      print("loadUrlSound error", error)
    }
    return nil
  }

  func loadBundleAudio(_ fileName: String) -> AVAudioPlayer? {
    let path = Bundle.main.path(forResource: fileName, ofType: nil)!
    let url = URL(fileURLWithPath: path)
    do {
      return try AVAudioPlayer(contentsOf: url)
    } catch {
      print("loadBundleAudio error", error)
    }
    return nil
  }

  static let audioRef = [
    "Samples/Bass Synth.mp3",
    "Samples/Counting.mp3",
    "Samples/Guitar.mp3",
    "Samples/Piano.mp3",
    "Samples/Strings.mp3",
    "Samples/Synth.mp3",
    "Samples/alphabet.mp3",
    "Samples/bass_drum_C1.wav",
    "Samples/beat.aiff",
    "Samples/clap_D#1.wav",
    "Samples/closed_hi_hat_F#1.wav",
    "Samples/hi_tom_D2.wav",
    "Samples/lo_tom_F1.wav",
    "Samples/mid_tom_B1.wav",
    "Samples/open_hi_hat_A#1.wav",
    "Samples/snare_D1.wav",
    "https://www.youraccompanist.com/images/stories/Reference%20Scales_On%20A%20Flat-G%20Sharp.mp3",
    "bbc-birds-1.m4a",
    "https://www.youraccompanist.com/images/stories/Reference%20Scales_Pentatonic%20on%20F%20Sharp.mp3",
    "bbc-birds-2.m4a",
    "https://www.youraccompanist.com/images/stories/Reference%20Scales_Chromatic%20Scale%20On%20F%20Sharp.mp3",
  ]

}
