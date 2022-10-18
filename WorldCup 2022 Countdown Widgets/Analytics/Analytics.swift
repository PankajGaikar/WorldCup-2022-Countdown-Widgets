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
        let concatedString = location.lowercased().replacingOccurrences(of: " ", with: "_")
        let userDefaultsString = concatedString + "_" + data.lowercased().replacingOccurrences(of: " ", with: "_")
        guard hasReportedAlready(report: userDefaultsString) == false else {
            return
        }
        storeReportLocally(report: userDefaultsString)
        Analytics.logEvent(userDefaultsString, parameters: ["data": data])
    }

    func reportError(location: String, error: String) {
        let error = "error" + "_" + error.lowercased().replacingOccurrences(of: " ", with: "_")
        Analytics.logEvent(error, parameters: [location: error])
    }

    func storeReportLocally(report: String) {
        UserDefaults.standard.setValue(report, forKey: report)
        UserDefaults.standard.synchronize()
    }

    func hasReportedAlready(report: String) -> Bool {
        return UserDefaults.standard.valueExists(forKey: report)
    }
}

extension UserDefaults {

    func valueExists(forKey key: String) -> Bool {
        return object(forKey: key) != nil
    }

}
