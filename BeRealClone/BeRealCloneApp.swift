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
//            CameraView(viewModel:CameraViewModel(user: AuthenticationViewModel.shared.currentUser!))
            MainView().environmentObject(AuthenticationViewModel.shared)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    
    return true
  }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async ->
        UIBackgroundFetchResult{
            return .noData
        }
}

