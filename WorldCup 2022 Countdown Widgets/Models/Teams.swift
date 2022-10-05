//
//  Teams.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 05/10/22.
//

import Foundation

enum Country {
    case England
    case Iran
    case USA
    case Wales
    case Qatar
    case Ecuador
    case Senegal
    case Netherlands
    case Argentina
    case SaudiArabia
    case Mexico
    case Poland
    case France
    case Australia
    case Denmark
    case Tunisia
    case Spain
    case CostaRica
    case Germany
    case Japan
    case Belgium
    case Canada
    case Morocco
    case Croatia
    case Brazil
    case Serbia
    case Switzerland
    case Cameroon
    case Portugal
    case Ghana
    case Uruguay
    case KoreaRepublic

    func getCountryName() -> String {
        switch self {
        case .England:
            return "England"
        case .Iran:
            return "Iran"
        case .USA:
            return "USA"
        case .Wales:
            return "Wales"
        case .Qatar:
            return "Qatar"
        case .Ecuador:
            return "Ecuador"
        case .Senegal:
            return "Senegal"
        case .Netherlands:
            return "Netherlands"
        case .Argentina:
            return "Argentina"
        case .SaudiArabia:
            return "Saudi Arabia"
        case .Mexico:
            return "Mexico"
        case .Poland:
            return "Poland"
        case .France:
            return "France"
        case .Australia:
            return "Australia"
        case .Denmark:
            return "Denmark"
        case .Tunisia:
            return "Tunisia"
        case .Spain:
            return "Spain"
        case .CostaRica:
            return "CostaRica"
        case .Germany:
            return "Germany"
        case .Japan:
            return "Japan"
        case .Belgium:
            return "Belgium"
        case .Canada:
            return "Canada"
        case .Morocco:
            return "Morocco"
        case .Croatia:
            return "Croatia"
        case .Brazil:
            return "Brazil"
        case .Serbia:
            return "Serbia"
        case .Switzerland:
            return "Switzerland"
        case .Cameroon:
            return "Cameroon"
        case .Portugal:
            return "Portugal"
        case .Ghana:
            return "Ghana"
        case .Uruguay:
            return "Uruguay"
        case .KoreaRepublic:
            return "Korea Republic"
        }
    }

    func getCountryCode() -> String {
        switch self {
        case .England:
            return "UK"
        case .Iran:
            return "IR"
        case .USA:
            return "US"
        case .Wales:
            return "UK"
        case .Qatar:
            return "QA"
        case .Ecuador:
            return "EC"
        case .Senegal:
            return "SN"
        case .Netherlands:
            return "NL"
        case .Argentina:
            return "AR"
        case .SaudiArabia:
            return "SA"
        case .Mexico:
            return "MX"
        case .Poland:
            return "PL"
        case .France:
            return "FR"
        case .Australia:
            return "AU"
        case .Denmark:
            return "DK"
        case .Tunisia:
            return "TN"
        case .Spain:
            return "ES"
        case .CostaRica:
            return "CR"
        case .Germany:
            return "DE"
        case .Japan:
            return "JP"
        case .Belgium:
            return "BE"
        case .Canada:
            return "CA"
        case .Morocco:
            return "MA"
        case .Croatia:
            return "HR"
        case .Brazil:
            return "BR"
        case .Serbia:
            return "RS"
        case .Switzerland:
            return "CH"
        case .Cameroon:
            return "CM"
        case .Portugal:
            return "PT"
        case .Ghana:
            return "GH"
        case .Uruguay:
            return "UY"
        case .KoreaRepublic:
            return "KR"
        }
    }
}
