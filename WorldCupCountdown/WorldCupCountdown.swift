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
        WorldCupEntry(date: Date(), configuration: ConfigurationIntent(), widgetType: .qatar2022Trophy)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (WorldCupEntry) -> ()) {
        WorldCupAnalytics().reportAnalytics(location: "Provider", data: "getSnapshot")
        let entry = WorldCupEntry(date: Date(), configuration: configuration, widgetType: .qatar2022Trophy)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        reportAnalytics(configuration: configuration)
        WidgetAPIManager().downloadImage(from: getImagePath(configuration: configuration)) { image in
            var entries: [WorldCupEntry] = []
            let currentDate = Date()
            let entryDate = Calendar.current.date(byAdding: .hour, value: 1, to: currentDate)!
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
            return configuration.customConfigCountry?.imageName ?? ""
        case .player:
            return configuration.customConfigPlayer?.imageName ?? ""
        case .qatar2022Trophy:
            return "WorldCup2022"
        case .unknown:
            return ""
        }
    }

    func reportAnalytics(configuration: ConfigurationIntent) {
        switch configuration.widgetType {
        case .country:
            WorldCupAnalytics().reportAnalytics(location: "widget_country", data: configuration.customConfigCountry?.imageName ?? "")
        case .player:
            WorldCupAnalytics().reportAnalytics(location: "widget_player", data: configuration.customConfigPlayer?.imageName ?? "")
        case .qatar2022Trophy:
            WorldCupAnalytics().reportAnalytics(location: "widget_signature", data: "WorldCup")
        case .unknown: break
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
    @Environment(\.widgetFamily) private var family

    var body: some View {
        if #available(iOSApplicationExtension 16.0, *) {
            if family == .accessoryRectangular {
                AccessoryRectangularView()
            } else if family == .accessoryInline {
                AccessoryInlineView()
            } else {
                HomeWidgetView(entry: entry)
            }
        } else {
            HomeWidgetView(entry: entry)
        }
    }
}

@main
struct WorldCupCountdown: Widget {
    let kind: String = "WorldCupCountdown"
    private var supportedFamilies: [WidgetFamily] {
        if #available(iOSApplicationExtension 16.0, *) {
            return [
                .systemSmall,
                .systemMedium,
                .systemLarge,
                .systemExtraLarge,
                .accessoryRectangular,
                .accessoryInline
            ]
        } else if #available(iOSApplicationExtension 16.0, *) {
            return [
                .systemSmall,
                .systemMedium,
                .systemLarge,
                .systemExtraLarge
            ]
        } else {
            return [
                .systemSmall,
                .systemMedium,
                .systemLarge
            ]
        }
    }

    init() {
        FirebaseApp.configure()
        Analytics.setAnalyticsCollectionEnabled(true)
    }

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WorldCupCountdownEntryView(entry: entry)
        }
        .configurationDisplayName("Countdown to Qatar 2022 - Widgets")
        .description("Select from your country's flags, favorite players to setup widgets for upcoming Qatar 2022 event.")
        .supportedFamilies(supportedFamilies)
    }
}

struct WorldCupCountdown_Previews: PreviewProvider {

    static func getCountry() -> WorldCupEntry {
        var entry = WorldCupEntry(date: Date(), configuration: ConfigurationIntent(), widgetType: .country)
        entry.image = UIImage(named: "WorldCup")
        return entry
    }

    static var previews: some View {
        WorldCupCountdownEntryView(entry: getCountry())
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
