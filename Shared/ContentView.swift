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
                    Text("Page1")
                }
                NavigationLink (destination: Page2()) {
                    Text("Page2")
                }
                NavigationLink (destination: Page3()) {
                    Text("Page3_AudioDJ")
                }
                NavigationLink (destination: Page4()) {
                    Text("Page4")
                }
                NavigationLink (destination: Page5()) {
                    Text("Page5")
                }
                NavigationLink (destination: Page6()) {
                    Text("Page6")
                }
                NavigationLink (destination: Page7()) {
                    Text("Page7")
                }
                NavigationLink (destination: Page8()) {
                    Text("Page8_AudioDJ")
                }
                // These view require environmentObject
//                NavigationLink (destination: Page9()) {
//                    Text("Page9_env")
//                }
//                NavigationLink (destination: Page10()) {
//                    Text("Page10")
//                }
                // SwiftUI limit: only 9 inline links
                // NavigationLink (destination: Pag11_Timer()) {
                //  Text("Page11")
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



