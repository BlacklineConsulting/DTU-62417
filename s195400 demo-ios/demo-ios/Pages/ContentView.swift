import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .onAppear() {
//                ShowCasePrinter.run()
                ShowCaseController.run()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
