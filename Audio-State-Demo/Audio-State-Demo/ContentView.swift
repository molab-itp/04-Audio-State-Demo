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
                NavigationLink (destination: Page1()) {
                    Text("Page1-BundleAudio")
                }
                NavigationLink (destination: Page2()) {
                    Text("Page2-Timer")
                }
                NavigationLink (destination: Page3()) {
                    Text("Page3-UrlAudio")
                }
                NavigationLink (destination: Page4()) {
                    Text("Page4-AudioDJ")
                }
                NavigationLink (destination: Page5()) {
                    Text("Page5-Nav-Link")
                }
                NavigationLink (destination: Page6()) {
                    Text("Page6-Nav-Button")
                }
                NavigationLink (destination: Page7()) {
                    Text("Page7-Random")
                }
                NavigationLink (destination: Page8()) {
                    Text("Page8-AudioDJ")
                }
                // These view require environmentObject
//                NavigationLink (destination: Page9()) {
//                    Text("Page9-env")
//                }
//                NavigationLink (destination: Page10()) {
//                    Text("Page10-Memory")
//                }
                // SwiftUI limit: only 9 inline links
                // NavigationLink (destination: Pag11()) {
                //  Text("Page11-Timer")
                // }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



