//
//  Utilities.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 16/10/22.
//

import Foundation

extension Bundle {
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
}
