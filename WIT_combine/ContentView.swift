import SwiftUI
// base page name
var pageName: String = "Welcome"
var authC = auth()

struct ContentView: View {
    var flag: Int = 0
    var body: some View {
        VStack{
            Text("Please Log In With Google")
                .padding()
            HStack{
                Button(action: {
                    authC.gLog()
                }) {
                Text("Log In with Google")
                    .padding()
            }
            } // HS
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
