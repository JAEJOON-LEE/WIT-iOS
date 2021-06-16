import Foundation
import Firebase
import GoogleSignIn
import SwiftUI
class auth {
    // google auth login
    func gLog(){
        if(GIDSignIn.sharedInstance()?.presentingViewController == nil){
            GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
        }
        GIDSignIn.sharedInstance()?.signIn()
    }
}
