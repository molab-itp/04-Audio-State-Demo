//
// MemoryModel to track likes and visits per item

import SwiftUI

struct Page10: View {
    
    @State private var navPath = NavigationPath()
    
    @EnvironmentObject var audioDJ:AudioDJ
    
    let selections = ["0-A","1-B","2-C","3-D"]
    
    @StateObject var model = MemoryModel()

    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack {
                Button("Tap for random 0-3") {
                    let index = Int.random(in:0..<selections.count)
                    // let sel = selections[index];
                    choose( index )
                }
                List {
                    Button("Play-"+selections[0]) { choose( 0 ) }
                    Button("Play-"+selections[1]) { choose( 1 ) }
                    Button("Play-"+selections[2]) { choose( 2 ) }
                    Button("Play-"+selections[3]) { choose( 3 ) }
                }
            }
            .navigationTitle("Random Pick 0-3")
            .navigationDestination(for: Int.self) { index in
                let item = model.items[index]
                MemoryView(item: item, model: model)
            }
            .onAppear {
                audioDJ.stop()
            }
        }
    }
    
    func choose(_ index:Int) {
        let item = model.items[index]
        audioDJ.choose( index )
        model.visit(item.id)
        audioDJ.play()
        navPath.append(index)
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
            Button("Reset-Count") {
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

struct Page10_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Page10()
                .environmentObject(AudioDJ())
        }
    }
}
