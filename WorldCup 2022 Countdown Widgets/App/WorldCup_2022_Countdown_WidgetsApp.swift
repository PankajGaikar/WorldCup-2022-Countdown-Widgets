//
//  WorldCup_2022_Countdown_WidgetsApp.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 02/10/22.
//

import SwiftUI
import FirebaseCore
import FirebaseAnalytics
import SDWebImageSwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        Analytics.setAnalyticsCollectionEnabled(true)



        // Add default HTTP header
        SDWebImageDownloader.shared.setValue("image/webp,image/apng,image/*,*/*;q=0.8", forHTTPHeaderField: "Accept")

        // Add multiple caches
        let cache = SDImageCache(namespace: "tiny")
        cache.config.maxMemoryCost = 500 * 1024 * 1024 // 100MB memory
        cache.config.maxDiskSize = 250 * 1024 * 1024 // 50MB disk
        SDImageCachesManager.shared.addCache(cache)
        SDWebImageManager.defaultImageCache = SDImageCachesManager.shared

        SDWebImageManager.defaultImageLoader = SDImageLoadersManager.shared

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
