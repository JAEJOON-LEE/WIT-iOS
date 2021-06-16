import SwiftUI
import Firebase
@main
struct WITApp: App {
    
    //for firebasce connection
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Store()) //필수이다.
        }
    }
}
class Store: ObservableObject {
    //. ObservableObject 프로토콜은 클래스에만 쓰일 수 있다.
    //외부에서 참조할 변수 timeCount 를 @Published 어노테이션으로 지정해 준다.
    
    @Published var following: [Person] = [Person]()
    
    init() {
        following = ApiService.personApi.getFollowing()
    }
}

//firebase connection
class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        print("Firevase is connected")
        FirebaseApp.configure()
        return true
    }
}
