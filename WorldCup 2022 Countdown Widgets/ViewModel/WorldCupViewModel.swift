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
    static let LAST_NETWORK_FETCH = "LAST_NETWORK_FETCH"

    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
            self.countDownString()
        }
    }

    let db = Firestore.firestore()
    @Published var players: [Player] = []

    override init() {
        self.referenceDate = WorldCupViewModel.getDate()!
        self.nowDate = Date()
        super.init()
        _ = self.timer
        getPlayers()
    }

    func getPlayers() {
        if WorldCupViewModel.shouldMakeNetworkFetch() == false {
            print("Fetching local")
            players = PersistanceManager.shared.retrievePlayers()
            return
        }
        print("Fetching network")

        var newPlayers: [Player] = []
        db.collection("PlayerDatabase").getDocuments { querySnapshot, err in
            if let err = err {
                print(err);
                WorldCupAnalytics().reportError(location: "WorldCupViewModel getPlayers", error: err.localizedDescription)
                self.players = PersistanceManager.shared.retrievePlayers()
                return
            }
            for document in querySnapshot!.documents {
                print("\(document.documentID) => \(document.data())")
                let player = Player(id: document.documentID,
                                    name: document["name"] as! String,
                                    countryCode: document["countryCode"] as! String,
                                    imagePath: document["imagePath"] as! String,
                                    country: document["country"] as! String,
                                    rank: document["rank"] as! Int)
                newPlayers.append(player)
                PersistanceManager.shared.store(player: player)
            }
            self.players = newPlayers.sorted(by: { $0.rank < $1.rank })
            UserDefaults(suiteName: PersistanceManager.SHARED_APP_GROUP_KEY)!.setValue(Date(), forKey: WorldCupViewModel.LAST_NETWORK_FETCH)
            UserDefaults(suiteName: PersistanceManager.SHARED_APP_GROUP_KEY)!.synchronize()
        }
    }

    static func shouldMakeNetworkFetch() -> Bool {
        guard let date = UserDefaults(suiteName: PersistanceManager.SHARED_APP_GROUP_KEY)!.value(forKey: WorldCupViewModel.LAST_NETWORK_FETCH) as? Date else { return true }
        return Calendar.current.dateComponents([.hour], from: date, to: Date()).hour ?? 13 > 12 ? true : false
    }

    static func getDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale.current
        let date = dateFormatter.date(from: "2022-11-20T16:00:00")
        return date
    }

    func countDownString() {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.day, .hour, .minute, .second],
                            from: nowDate,
                            to: referenceDate)
        self.timeToWorldCup = components
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
