//
//  AudioDemoApp.swift
//  Shared
//
//  Created by jht2 on 2/16/22.
//

import SwiftUI

@main
struct AudioDemoApp: App {
  
  @StateObject var audioDJ = AudioDJ()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(audioDJ)
    }
  }
}
