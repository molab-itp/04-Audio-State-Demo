//
//  ContentView.swift
//  Shared
//
//  Created by jht2 on 2/16/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink (destination: CountDownTimerView()) {
                    Text("CountDownTimerView")
                }
                NavigationLink (destination: PlayAudioView()) {
                    Text("PlayAudioView")
                }
                NavigationLink (destination: LapseTimerView()) {
                    Text("LapseTimerView")
                }
                NavigationLink (destination: PlayAudioUrlView()) {
                    Text("PlayAudioUrlView")
                }
                NavigationLink (destination: PlayAudioDJView()) {
                    Text("PlayAudioDJView")
                }
                NavigationLink (destination: NavLinkView()) {
                    Text("NavLinkView")
                }
                NavigationLink (destination: NavButtonView()) {
                    Text("NavButtonView")
                }
                NavigationLink (destination: NavPathRandomView()) {
                    Text("NavPathRandomView")
                }
                NavigationLink (destination: NavPathAudioDJRandomView()) {
                    Text("NavPathAudioDJRandomView")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

// Use Group to avoid SwiftUI limit of 9 inline Views
//                Group() {
//                }

// https://chatgpt.com/c/66f67050-4b18-8002-b1a4-b6856c90e1d7
// For SwiftUI in a VStack how to increase spacing between rows
/*
 VStack(spacing: 20) { // Set the spacing between rows to 20
 Text("Row 1")
 Text("Row 2")
 Text("Row 3")
 }
 */
