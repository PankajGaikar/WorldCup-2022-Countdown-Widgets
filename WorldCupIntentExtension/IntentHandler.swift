//
//  IntentHandler.swift
//  WorldCupIntentExtension
//
//  Created by Pankaj Gaikar on 09/10/22.
//

import Intents

class IntentHandler: INExtension, ConfigurationIntentHandling {
    func provideCountryTypeOptionsCollection(for intent: ConfigurationIntent, with completion: @escaping (INObjectCollection<CountryType>?, Error?) -> Void) {
        var albums: [CountryType] = []

        for country in Country.allCases {
            albums.append(CountryType(identifier: country.getCountryCode(), display: country.getCountryName(), pronunciationHint: country.getCountryName()))
        }
        completion(INObjectCollection(items: albums), nil)
    }

    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
}
