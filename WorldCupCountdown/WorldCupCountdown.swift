//
//  WorldCupCountdown.swift
//  WorldCupCountdown
//
//  Created by Pankaj Gaikar on 10/10/22.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> WorldCupEntry {
        WorldCupEntry(date: Date(), configuration: ConfigurationIntent(), widgetType: .worldCup)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (WorldCupEntry) -> ()) {
        let entry = WorldCupEntry(date: Date(), configuration: configuration, widgetType: .worldCup)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [WorldCupEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        let entryDate = Calendar.current.date(byAdding: .minute, value: 5, to: currentDate)!
        var entry = WorldCupEntry(date: entryDate, configuration: configuration, widgetType: configuration.widgetType)
        entry.imageName = configuration.country?.imageName
        entries.append(entry)
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct WorldCupEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let widgetType: WidgetType
    var imageName: String? = ""
}

struct WorldCupCountdownEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        if entry.widgetType == .worldCup {
            WorldCupView()
        } else {
            ZStack(alignment: .bottomLeading) {
                Image(getImageName())
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .background(Image("WorldCup_1024").resizable().scaledToFill().overlay(Color.black.opacity(0.4)))
                
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

    func getImageName() -> String {
        entry.imageName ?? "WorldCup_1024"
    }
}

@main
struct WorldCupCountdown: Widget {
    let kind: String = "WorldCupCountdown"

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
        entry.imageName = "esp"
        return entry
    }

    static var previews: some View {
        WorldCupCountdownEntryView(entry: getCountry())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

struct WorldCupCountdown_Previews2: PreviewProvider {

    static func getCountry() -> WorldCupEntry {
        var entry = WorldCupEntry(date: Date(), configuration: ConfigurationIntent(), widgetType: .country)
        entry.imageName = "esp"
        return entry
    }

    static var previews: some View {
        WorldCupCountdownEntryView(entry: getCountry())
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

struct WorldCupCountdown_Previews3: PreviewProvider {

    static func getCountry() -> WorldCupEntry {
        var entry = WorldCupEntry(date: Date(), configuration: ConfigurationIntent(), widgetType: .country)
        entry.imageName = "esp"
        return entry
    }

    static var previews: some View {
        WorldCupCountdownEntryView(entry: getCountry())
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
