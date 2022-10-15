//
//  Analytics.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 15/10/22.
//

import Foundation
import FirebaseAnalytics

struct WorldCupAnalytics {
    func reportAnalytics(location: String, data: String) {
        Analytics.logEvent(location.lowercased().replacingOccurrences(of: " ", with: "_"), parameters: ["data": data])
    }

    func reportError(location: String, error: String) {
        Analytics.logEvent("error", parameters: [location: error])
    }
}
