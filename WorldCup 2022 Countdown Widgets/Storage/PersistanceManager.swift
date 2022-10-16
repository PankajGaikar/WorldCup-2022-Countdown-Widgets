//
//  PersistanceManager.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 14/10/22.
//

import Foundation
import UserDefaultsStore

class PersistanceManager: NSObject, ObservableObject {

    static let shared = PersistanceManager()

    static let SHARED_APP_GROUP_KEY = "group.com.pankajgaikar.worldcup"

    var photoStore = UserDefaultsStore<Player>(uniqueIdentifier: SHARED_APP_GROUP_KEY)

    override init() {
        super.init()
    }

    func store(player: Player) {
        do {
            try photoStore.save(player)
        } catch let error {
            print("Oh No, failed to save. \(error.localizedDescription)")
        }
    }

    func remove(player: Player) {
        photoStore.delete(withId: player.id)
    }

    func retrievePlayers() -> [Player] {
        return photoStore.allObjects().sorted(by: { $0.rank < $1.rank })
    }

}
