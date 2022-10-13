//
//  WidgetView.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 06/10/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct WidgetView: View {

    let imagePath: String

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            WebImage(url: URL(string: "https://github.com/PankajGaikar/Storage/blob/main/\(imagePath).jpg?raw=true"))
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

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
        .cornerRadius(10)
    }
}

struct ContentView_Previews_1: PreviewProvider {
    static var previews: some View {
        RootContainerView()
    }
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(imagePath: "WorldCup_1024")
    }
}
