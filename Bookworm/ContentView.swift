
import SwiftUI

struct ContentView: View {
    
    @AppStorage("notes") private var notes = ""

    var body: some View {
        NavigationView {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
