//
//  Audio_State_DemoApp.swift
//  Audio-State-Demo
//
//  Created by jht2 on 9/14/23.
//

import SwiftUI

@main
struct Audio_State_DemoApp: App {
    @StateObject var audioDJ = AudioDJ()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioDJ)
        }
    }
}
