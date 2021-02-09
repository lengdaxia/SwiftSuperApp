//
//  LandmarkWidget.swift
//  LandmarkWidget
//
//  Created by leng on 2021/02/09.
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

struct LandmarkWidgetEntryView : View {
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var family // 尺寸环境变量
    var mylink: URL = URL(string: "www.baidu.com")!

    var body: some View {
        
        switch family {
        case .systemSmall:
            VStack{
                Text("小尺寸").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(entry.date,style: .date).font(.subheadline)
            }.widgetURL(mylink.appendingPathComponent("small"))
            
        case .systemMedium:
            VStack{
                Text("中等尺寸").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(entry.date,style: .date).font(.subheadline)
            }.widgetURL(mylink.appendingPathComponent("medium"))
        case .systemLarge:
            VStack{
                Text("大尺寸").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(entry.date,style: .date).font(.subheadline)
            }.widgetURL(mylink.appendingPathComponent("large"))
        default:
              Text("Hello Widget!")
        }
    }
}

@main
struct LandmarkWidget: Widget {
    let kind: String = "LandmarkWidget"

    var body: some WidgetConfiguration {
        
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            LandmarkWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")

        
    }
}

struct LandmarkWidget_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
