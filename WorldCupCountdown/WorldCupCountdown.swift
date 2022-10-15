//
//  WorldCupCountdown.swift
//  WorldCupCountdown
//
//  Created by Pankaj Gaikar on 10/10/22.
//

import WidgetKit
import SwiftUI
import Intents
import FirebaseCore
import FirebaseAnalytics

struct Provider: IntentTimelineProvider {

    static let apiManager = WidgetAPIManager()

    func placeholder(in context: Context) -> WorldCupEntry {
        WorldCupEntry(date: Date(), configuration: ConfigurationIntent(), widgetType: .worldCup)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (WorldCupEntry) -> ()) {
        let entry = WorldCupEntry(date: Date(), configuration: configuration, widgetType: .worldCup)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {

        WidgetAPIManager().downloadImage(from: getImagePath(configuration: configuration)) { image in
            var entries: [WorldCupEntry] = []

            // Generate a timeline consisting of five entries an hour apart, starting from the current date.
            let currentDate = Date()
            let entryDate = Calendar.current.date(byAdding: .minute, value: 5, to: currentDate)!
            var entry = WorldCupEntry(date: entryDate, configuration: configuration, widgetType: configuration.widgetType)
            entry.image = image
            entries.append(entry)
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }

    func getImagePath(configuration: ConfigurationIntent) -> String {
        switch configuration.widgetType {
        case .country:
            return configuration.customConfig?.imageName ?? ""
        case .player:
            return configuration.customConfig?.imageName ?? ""
        case .worldCup:
            return "WorldCup"
        case .unknown:
            return ""
        }
    }
}

struct WorldCupEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let widgetType: WidgetType
    var image: UIImage?
}

struct WorldCupCountdownEntryView : View {
    var entry: Provider.Entry
    
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

                        Text(WorldCupViewModel.shared.getTimeToWorldCup())
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
        } else {
            WorldCupView()
        }
    }
}

@main
struct WorldCupCountdown: Widget {
    let kind: String = "WorldCupCountdown"

    init() {
        FirebaseApp.configure()
        Analytics.setAnalyticsCollectionEnabled(true)
    }

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WorldCupCountdownEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct WorldCupCountdown_Previews: PreviewProvider {

    static func getCountry() -> WorldCupEntry {
        var entry = WorldCupEntry(date: Date(), configuration: ConfigurationIntent(), widgetType: .country)
        return entry
    }

    static var previews: some View {
        WorldCupCountdownEntryView(entry: getCountry())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
