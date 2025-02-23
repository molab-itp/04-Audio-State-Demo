//
//  Audio_State_DemoApp.swift
//  Audio-State-Demo
//
//  Created by jht2 on 9/14/23.
//

import SwiftUI

@main
struct Audio_State_DemoApp: App {
    @State var audioDJ = AudioDJ()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(audioDJ)
        }
    }
}
//#Preview()
//{
//    Audio_State_DemoApp()
//}
