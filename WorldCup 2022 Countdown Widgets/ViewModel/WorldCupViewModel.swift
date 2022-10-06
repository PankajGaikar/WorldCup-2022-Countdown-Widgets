//
//  WorldCupViewModel.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 06/10/22.
//

import Foundation

class WorldCupViewModel: NSObject, ObservableObject {

    var nowDate: Date
    let referenceDate: Date
    @Published var timeToWorldCup: DateComponents?
    
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
            self.countDownString()
        }
    }

    override init() {
        self.referenceDate = WorldCupViewModel.getDate()!
        self.nowDate = Date()
        super.init()
        _ = self.timer

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


}
