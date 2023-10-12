//
//  BeRealCloneApp.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 01/10/2023.
//

import SwiftUI
import FirebaseCore
@main
struct BeRealCloneApp: App {
    init(){
        UITextView.appearance().backgroundColor = .clear
    }
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            MainAuthenticationView()
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
