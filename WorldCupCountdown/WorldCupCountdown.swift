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
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct WorldCupCountdownEntryView : View {
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
    static var previews: some View {
        WorldCupCountdownEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
