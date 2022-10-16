//
//  TimeView.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 06/10/22.
//

import SwiftUI

struct TimeView: View {
    let time: String
    let unit: String
    
    var body: some View {
        VStack {
            Text(time)
                .font(.largeTitle)
                .bold()

            Text(unit)
                .font(.caption)
        }
        .frame(maxWidth: .infinity)
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView(time: "27", unit: "DAYS")
    }
}
