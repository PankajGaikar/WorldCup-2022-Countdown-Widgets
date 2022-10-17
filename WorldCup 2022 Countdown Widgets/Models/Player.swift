//
//  Player.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 13/10/22.
//

import Foundation

struct Player: Codable, Identifiable {
    let id: String
    let name: String
    let countryCode: String?
    let imagePath: String
    let country: String?
    let rank: Int?
}

