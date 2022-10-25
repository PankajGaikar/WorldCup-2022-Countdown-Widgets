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
    @Environment(\.widgetFamily) private var family

    var body: some View {
        if let image = entry.image {
            if entry.widgetType == .country && (family == .systemSmall || family == .systemLarge) {
                HomeWidgetView_CountrySquare(image: image)
            } else if entry.widgetType == .country && family == .systemMedium {
                HomeWidgetView_CountryRectangle(image: image)
            } else if #available(iOSApplicationExtension 15.0, *), entry.widgetType == .country && family == .systemExtraLarge {
                HomeWidgetView_CountryRectangle(image: image)
            } else {
                ZStack(alignment: .bottomLeading) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .background(Image(uiImage: image).resizable().scaledToFill().overlay(Color.black.opacity(0.4)))

                    ZStack {
                        VStack {
                            Text("Time to Qatar 2022")
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
            }
        } else {
            WorldCupView()
        }
    }
}

struct WorldCupCountdown_Previews1: PreviewProvider {

    static func getCountry() -> WorldCupEntry {
        var entry = WorldCupEntry(date: Date(), configuration: ConfigurationIntent(), widgetType: .country)
        let data = try! Data(contentsOf: URL(string: "https://github.com/PankajGaikar/Storage/blob/main/arg.jpg?raw=true")!)
        entry.image = UIImage(data: data)
        return entry
    }

    static var previews: some View {
        HomeWidgetView(entry: getCountry())
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        if #available(iOSApplicationExtension 15.0, *) {
            HomeWidgetView(entry: getCountry())
                .previewContext(WidgetPreviewContext(family: .systemExtraLarge))
        }
    }
}
