//
//  Teams.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 05/10/22.
//

import Foundation

enum Country: CaseIterable {
    case Argentina
    case Brazil
    case England
    case France
    case Germany
    case Netherlands
    case Portugal
    case Spain
    case Iran
    case USA
    case Wales
    case Qatar
    case Ecuador
    case Senegal
    case SaudiArabia
    case Mexico
    case Poland
    case Australia
    case Denmark
    case Tunisia
    case CostaRica
    case Japan
    case Belgium
    case Canada
    case Morocco
    case Croatia
    case Serbia
    case Switzerland
    case Cameroon
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

    func getImageName() -> String {
        switch self {
        case .England:
            return "eng"
        case .Iran:
            return "irn"
        case .USA:
            return "usa"
        case .Wales:
            return "wal"
        case .Qatar:
            return "qat"
        case .Ecuador:
            return "ecu"
        case .Senegal:
            return "sen"
        case .Netherlands:
            return "ned"
        case .Argentina:
            return "arg"
        case .SaudiArabia:
            return "ksa"
        case .Mexico:
            return "mex"
        case .Poland:
            return "pol"
        case .France:
            return "fra"
        case .Australia:
            return "aus"
        case .Denmark:
            return "den"
        case .Tunisia:
            return "tun"
        case .Spain:
            return "esp"
        case .CostaRica:
            return "crc"
        case .Germany:
            return "ger"
        case .Japan:
            return "jpn"
        case .Belgium:
            return "bel"
        case .Canada:
            return "can"
        case .Morocco:
            return "mar"
        case .Croatia:
            return "cro"
        case .Brazil:
            return "bra"
        case .Serbia:
            return "srb"
        case .Switzerland:
            return "sui"
        case .Cameroon:
            return "cmr"
        case .Portugal:
            return "por"
        case .Ghana:
            return "gha"
        case .Uruguay:
            return "uru"
        case .KoreaRepublic:
            return "kor"
        }
    }
}

/*

 struct WorldCup_CountdownEntryView : View {
     var entry: Provider.Entry

     var body: some View {
         ZStack(alignment: .bottomLeading) {
             Image("WorldCup_1024")
                 .resizable()
                 .scaledToFit()
                 .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                 .background(Image("WorldCup_1024").resizable().scaledToFill())

             ZStack {
                 VStack {
                     Text("Time to WorldCup")
                         .font(.body)
                         .lineLimit(1)
                         .minimumScaleFactor(0.2)
                         .frame(maxWidth: .infinity)
                         .foregroundColor(.white)

                     Text(WorldCupViewModel().getTimeToWorldCup())
                         .font(.title)
                         .bold()
                         .minimumScaleFactor(0.2)
                         .lineLimit(1)
                         .frame(maxWidth: .infinity)
                         .padding(.horizontal, 5)
                         .foregroundColor(.white)
                 }
             }
             .background(Color.black.opacity(0.4))
         }
     }
 }

 @main
 struct WorldCup_Countdown: Widget {
     let kind: String = "WorldCup_Countdown"

     var body: some WidgetConfiguration {
         IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
             WorldCup_CountdownEntryView(entry: entry)
         }
         .configurationDisplayName("My Widget")
         .description("This is an example widget.")
     }
 }

 struct WorldCup_Countdown_Previews: PreviewProvider {
     static var previews: some View {
         WorldCup_CountdownEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
             .previewContext(WidgetPreviewContext(family: .systemSmall))
     }
 }

 /*
  func provideCountryOptionsCollection(for intent: ConfigurationIntent, with completion: @escaping (INObjectCollection<CountryType>?, Error?) -> Void) {
      var albums: [CountryType] = []

      for country in Country.allCases {
          albums.append(CountryType(identifier: country.getCountryCode(), display: country.getCountryName(), pronunciationHint: country.getCountryName()))
      }
      completion(INObjectCollection(items: albums), nil)

  }
  */

 */
