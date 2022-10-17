//
//  IntentHandler.swift
//  WorldCupIntent
//
//  Created by Pankaj Gaikar on 10/10/22.
//

import Intents
import FirebaseFirestore
import FirebaseCore

class IntentHandler: INExtension, ConfigurationIntentHandling {

    override init() {
        FirebaseApp.configure()
    }

    func provideCustomConfigPlayerOptionsCollection(for intent: ConfigurationIntent, with completion: @escaping (INObjectCollection<WidgetCustom>?, Error?) -> Void) {

        if WorldCupViewModel.shouldMakeNetworkFetch() == false {
            print("Fetching local")
            WorldCupAnalytics().reportAnalytics(location: "IntentHandler", data: "fetch local players")

            let players = PersistanceManager.shared.retrievePlayers()
            var albums: [WidgetCustom] = []
            for player in players {
                let widgetCountry = WidgetCustom(identifier: player.id, display: player.name, pronunciationHint: player.name)
                widgetCountry.imageName = player.imagePath
                albums.append(widgetCountry)
            }
            completion(INObjectCollection(items: albums), nil)
        } else {
            print("Fetching network")
            WorldCupAnalytics().reportAnalytics(location: "IntentHandler", data: "fetch network players")

            Firestore.firestore().collection("PlayerDatabase").getDocuments { querySnapshot, err in
                var newPlayers: [Player] = []
                if let err = err {
                    print(err);
                    WorldCupAnalytics().reportError(location: "IntentHandler provideCustomConfigPlayerOptionsCollection", error: err.localizedDescription)
                    newPlayers = PersistanceManager.shared.retrievePlayers()
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")

                        guard let name = document["name"] as? String,
                              let imagePath = document["imagePath"] as? String else { WorldCupAnalytics().reportError(location: "WorldCupViewModel getPlayers", error: "Missing info for \(document.documentID)"); continue }

                        let player = Player(id: document.documentID,
                                            name: name,
                                            countryCode: document["countryCode"] as? String,
                                            imagePath: imagePath,
                                            country: document["country"] as? String,
                                            rank: document["rank"] as? Int)

                        newPlayers.append(player)
                        PersistanceManager.shared.store(player: player)
                    }
                    newPlayers = newPlayers.sorted(by: { $0.rank ?? 10 < $1.rank ?? 10 })
                    UserDefaults(suiteName: PersistanceManager.SHARED_APP_GROUP_KEY)!.setValue(Date(), forKey: WorldCupViewModel.LAST_NETWORK_FETCH)
                    UserDefaults.standard.synchronize()
                }
                var albums: [WidgetCustom] = []
                for player in newPlayers {
                    let widgetCountry = WidgetCustom(identifier: player.id, display: player.name, pronunciationHint: player.name)
                    widgetCountry.imageName = player.imagePath
                    albums.append(widgetCountry)
                }
                completion(INObjectCollection(items: albums), nil)
            }
        }
    }

    func provideCustomConfigCountryOptionsCollection(for intent: ConfigurationIntent, with completion: @escaping (INObjectCollection<WidgetCustom>?, Error?) -> Void) {
        WorldCupAnalytics().reportAnalytics(location: "IntentHandler", data: "fetch countries")
        var albums: [WidgetCustom] = []

        for country in Country.allCases {
            let widgetCountry = WidgetCustom(identifier: country.getCountryCode(), display: country.getCountryName(), pronunciationHint: country.getCountryName())
            widgetCountry.imageName = country.getImageName()
            albums.append(widgetCountry)
        }
        completion(INObjectCollection(items: albums), nil)
    }

    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
}
