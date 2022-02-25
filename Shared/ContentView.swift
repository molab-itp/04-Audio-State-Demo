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
        NavigationLink (destination: Page2_AudioDJ()) {
          Text("Page2_AudioDJ")
        }
        NavigationLink (destination: Page3()) {
          Text("Page3")
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
        NavigationLink (destination: Page6_AudioDJ()) {
          Text("Page6_AudioDJ")
        }
        NavigationLink (destination: Page7_env()) {
          Text("Page7_env")
        }
        NavigationLink (destination: Page8_Memory()) {
          Text("Page8_Memory")
        }
        // SwiftUI limit: only 8 inline links
//        NavigationLink (destination: Page9_Timer()) {
//          Text("Page9_Timer")
//        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}



