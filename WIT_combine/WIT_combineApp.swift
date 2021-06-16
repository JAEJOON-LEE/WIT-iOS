import SwiftUI
import Firebase
import GoogleSignIn

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
class AppDelegate: NSObject, UIApplicationDelegate, GIDSignInDelegate{
    
    // User 정보를 서버로 부터 가져올경우 다음 싱글톤 객체 사용 (user.profile.suerId 등등)
       public static var user: GIDGoogleUser!
       
    func sign(_ signIn: GIDSignIn!,
              didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        
        // Check for sign in error
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        
        // Get credential object using Google ID token and Google access token
        guard let authentication = user.authentication else {
            return
        }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        // Authenticate with Firebase using the credential object
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print("Error occurs when authenticate with Firebase: \(error.localizedDescription)")
            }
                
            // Post notification after user successfully sign in
                    NotificationCenter.default.post(name: .signInGoogleCompleted, object: nil)
        }

    }
    // MARK:- Notification
    @objc private func userDidSignInGoogle(_ notification: Notification) {
        // Update screen after user successfully signed in
        Home()
    }
    
    // MARK:- Notification names
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
//        var configureError: NSError?
//              GGLContext.sharedInstance().configureWithError(&configureError)
//              assert(configureError == nil, "Error configuring Google services: \(configureError)")
//              GIDSignIn.sharedInstance().clientID = "Cliend id From GoogleService-Info.plist file"
//              GIDSignIn.sharedInstance().delegate = self
        print("Firevase is connected")
        
        return true
    }
}

extension Notification.Name {
    /// Notification when user successfully sign in using Google
    static var signInGoogleCompleted: Notification.Name {
        return .init(rawValue: #function)
    }
}
