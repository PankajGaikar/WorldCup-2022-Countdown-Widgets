//
//  AccessoryRectangularView.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 15/10/22.
//

import SwiftUI

struct AccessoryRectangularView: View {
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Image("WorldCup")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.2)
                VStack {
                    Text("Time to Qatar 2022")
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    Text(WorldCupViewModel.getDate()!, style: .relative)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                }
            }
        }
    }
}

struct AccessoryRectangularView_Previews: PreviewProvider {
    static var previews: some View {
        AccessoryRectangularView()
    }
}
