// MemoryModel to track likes and visits per item

import SwiftUI

struct Page8_Memory: View {
  @EnvironmentObject var audioDJ:AudioDJ
  @State private var selection: UUID? = nil
  @StateObject var model = MemoryModel()
  var body: some View {
    VStack {
      ForEach(model.items) { item in
        NavigationLink(destination: MemoryView(item: item, model: model), tag: item.id, selection: $selection) { EmptyView() }
      }
      // NavigationLink(destination: MemoryView(text: views[0], model: model), tag: 0, selection: $selection) { EmptyView() }
      Button("Tap to show 0 to 3") {
        let choice = Int.random(in: 0..<model.items.count)
        print("choice", choice)
        choose( choice )
      }
      Text("last selection \(audioDJ.soundIndex)")
      Button("Stop") {
        audioDJ.stop()
      }
      List {
        Button("Play-0") { choose( 0 ) }
        Button("Play-1") { choose( 1 ) }
        Button("Play-2") { choose( 2 ) }
        Button("Play-3") { choose( 3 ) }
      }
    }
    .onAppear {
      print("Page8_Memory onAppear audioDJ.soundIndex", audioDJ.soundIndex)
    }
    // .onDisappear { audioDJ.stop() }
    .navigationTitle("Random Pick 0 to 3")
  }
  
  func choose(_ choice:Int) {
    let item = model.items[choice]
    selection = item.id
    audioDJ.choose( choice )
    model.visit(item.id)
     audioDJ.play()
  }
}

// Model to track likes and visits count for an item

struct Item : Identifiable {
  let id = UUID()
  var likes:Int = 0
  var visits:Int = 0
  var text:String
}

class MemoryModel: ObservableObject {
  @Published var items:[Item]
  init() {
    print("MemoryModel init")
    // items for testing
    items = [Item(text:"View 0"),Item(text:"View 1"),Item(text:"View 2"),Item(text:"View 3")]
  }
  func like(_ id:UUID) {
    if let index = findIndex( id) {
      items[index].likes += 1
    }
  }
  func unlike(_ id:UUID) {
    if let index = findIndex( id) {
      items[index].likes -= 1
    }
  }
  func visit(_ id:UUID) {
    if let index = findIndex( id) {
      items[index].visits += 1
    }
  }
  func resetCounts(_ id:UUID) {
    if let index = findIndex( id) {
      items[index].visits = 0;
      items[index].likes = 0;
    }
  }
  func findIndex(_ id: UUID) -> Int? {
    return items.firstIndex { item in item.id == id }
  }
}

struct MemoryView: View {
  var item:Item
  var model:MemoryModel
  var body: some View {
    Text(item.text)
    HStack {
      Text("visits \(item.visits)")
      Button("Reset Count") {
        model.resetCounts(item.id)
      }
    }
    HStack {
      Text("likes \(item.likes)")
      Button("Like") {
        model.like(item.id)
      }
      Button("Unlike") {
        model.unlike(item.id)
      }
    }
  }
}

struct Page8_Memory_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Page8_Memory()
        .environmentObject(AudioDJ())
    }
  }
}
