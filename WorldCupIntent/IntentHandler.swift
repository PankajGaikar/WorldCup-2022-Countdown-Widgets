//
//  IntentHandler.swift
//  WorldCupIntent
//
//  Created by Pankaj Gaikar on 10/10/22.
//

import Intents

class IntentHandler: INExtension, ConfigurationIntentHandling {

    func provideCountryOptionsCollection(for intent: ConfigurationIntent, with completion: @escaping (INObjectCollection<WidgetCountry>?, Error?) -> Void) {
        var albums: [WidgetCountry] = []

        for country in Country.allCases {
            albums.append(WidgetCountry(identifier: country.getCountryCode(), display: country.getCountryName(), pronunciationHint: country.getCountryName()))
        }
        completion(INObjectCollection(items: albums), nil)

    }
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
}
