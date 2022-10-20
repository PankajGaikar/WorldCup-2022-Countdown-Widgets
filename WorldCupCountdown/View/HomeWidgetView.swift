//
//  HomeWidgetView.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 15/10/22.
//

import SwiftUI
import WidgetKit

struct HomeWidgetView: View {
    var entry: WorldCupEntry

    var body: some View {
        if let image = entry.image {
            ZStack(alignment: .bottomLeading) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .background(Image("WorldCup").resizable().scaledToFill().overlay(Color.black.opacity(0.4)))

                ZStack {
                    VStack {
                        Text("Time to WorldCup")
                            .font(.body)
                            .lineLimit(1)
                            .minimumScaleFactor(0.2)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)

                        Text(WorldCupViewModel.getDate()!, style: .relative)
                            .font(.title)
                            .bold()
                            .minimumScaleFactor(0.2)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 5)
                            .foregroundColor(.white)
                    }
                }
                .background(Color.black.opacity(0.4))
            }
        } else {
            WorldCupView()
        }
    }
}

struct WorldCupCountdown_Previews1: PreviewProvider {

    static func getCountry() -> WorldCupEntry {
        var entry = WorldCupEntry(date: Date(), configuration: ConfigurationIntent(), widgetType: .worldCup)
        entry.image = UIImage(named: "WorldCup")
        return entry
    }

    static var previews: some View {
        HomeWidgetView(entry: getCountry())
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
