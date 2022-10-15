//
//  IntentHandler.swift
//  WorldCupIntent
//
//  Created by Pankaj Gaikar on 10/10/22.
//

import Intents

class IntentHandler: INExtension, ConfigurationIntentHandling {
    func provideCustomConfigPlayerOptionsCollection(for intent: ConfigurationIntent, with completion: @escaping (INObjectCollection<WidgetCustom>?, Error?) -> Void) {
        var albums: [WidgetCustom] = []
        let players = PersistanceManager.shared.retrievePlayers()
        for player in players {
            let widgetCountry = WidgetCustom(identifier: player.id, display: player.name, pronunciationHint: player.name)
            widgetCountry.imageName = player.imagePath
            albums.append(widgetCountry)
        }
        completion(INObjectCollection(items: albums), nil)
    }
    
    func provideCustomConfigCountryOptionsCollection(for intent: ConfigurationIntent, with completion: @escaping (INObjectCollection<WidgetCustom>?, Error?) -> Void) {
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
