//
//  WorldCup_2022_Countdown_WidgetsApp.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 02/10/22.
//

import SwiftUI
import FirebaseCore
import FirebaseAnalytics

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        Analytics.setAnalyticsCollectionEnabled(true)
        return true
    }
}

@main
struct WorldCup_2022_Countdown_WidgetsApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            RootContainerView()
        }
    }
}
