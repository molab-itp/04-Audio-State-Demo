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
            VStack {
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
                // Use Group to avoid SwiftUI limit of 9 inline Views
                Group() {
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
                    // These view require environmentObject
                    //  NavigationLink (destination: NavPathAudioDJEnvView()) {
                    //      Text("NavPathAudioDJEnvView")
                    //  }
                    //  NavigationLink (destination: Page10()) {
                    //      Text("Page10-Memory")
                    //  }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



