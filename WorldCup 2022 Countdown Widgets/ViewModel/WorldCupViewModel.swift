//
//  WorldCupViewModel.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 06/10/22.
//

import Foundation
import FirebaseFirestore

class WorldCupViewModel: NSObject, ObservableObject {

    static let shared = WorldCupViewModel()
    var nowDate: Date
    let referenceDate: Date
    @Published var timeToWorldCup: DateComponents?
    let playerNames = ["bale", "davies", "debruyne", "eriksen_prem", "griezmann_prem", "hakimi", "hakimi_prem", "hernandez_prem", "honda_prem", "kane_prem", "khazri_prem", "kimmich", "kroose_germany_prem", "lewandowski", "lewandowski_poland_prem", "mane_prem", "matic_prem", "messi_prem", "modric", "modric_prem", "pedri", "pulisic", "ronaldo_prem", "ruiz_prem", "sahlawi_prem", "sardar", "son_prem", "suarez_prem", "xhaka_prem"]

    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
            self.countDownString()
        }
    }

    let db = Firestore.firestore()
    var players: [Player] = []

    override init() {
        self.referenceDate = WorldCupViewModel.getDate()!
        self.nowDate = Date()
        super.init()
        _ = self.timer
        getPlayers()

    }

    func getPlayers() {
        db.collection("Players").getDocuments { querySnapshot, err in
            if let err = err { return }
            for document in querySnapshot!.documents {
                print("\(document.documentID) => \(document.data())")
                self.players.append(Player(id: document.documentID, name: document["name"] as! String, countryCode: document["countryCode"] as! String, imageUrl: document["imageUrl"] as! String, country: document["country"] as! String))
            }
            print(self.players)
        }
    }

    static func getDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "CEST")
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: "2022-11-20T18:00:00")
    }

    func countDownString() {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.day, .hour, .minute, .second],
                            from: nowDate,
                            to: referenceDate)
        self.timeToWorldCup = components//String(format: "%02d DAYS%02d HOURS%02d MINUTES%02d SECONDS",
//                      components.day ?? 00,
//                      components.hour ?? 00,
//                      components.minute ?? 00,
//                      components.second ?? 00)
    }

    func getTimeToWorldCup() -> String {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.day, .hour, .minute, .second],
                            from: Date(),
                            to: WorldCupViewModel.getDate()!)

        return "\(components.day ?? -1)d \(components.hour ?? -1)h"
    }

}
