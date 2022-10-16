//
//  CountdownHeaderView.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 13/10/22.
//

import SwiftUI

struct CountdownHeaderView: View {
    @ObservedObject var viewModel = WorldCupViewModel.shared

    var body: some View {

        VStack {
            Image("Background-Banner")
                .resizable()
                .scaledToFit()
                .clipped()
                .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.30, alignment: .center)

            Text("Countdown to Qatar 2022")
                .font(.title2)
                .lineLimit(1)
                .minimumScaleFactor(0.6)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(0)

            if let components = viewModel.timeToWorldCup {
                HStack {
                    Spacer().frame(width: UIScreen.main.bounds.width * 0.12)

                    TimeView(time: "\(components.day ?? -1)", unit: "DAYS")
                    TimeView(time: "\(components.hour ?? -1)", unit: "HOURS")
                    TimeView(time: "\(components.minute ?? -1)", unit: "MINUTES")
                    TimeView(time: "\(components.second ?? -1)", unit: "SECONDS")

                    Spacer().frame(width: UIScreen.main.bounds.width * 0.12)
                }
                .padding(0)
                .padding(.bottom)
                .foregroundColor(.white)
            }
        }
        .background(Color.black.opacity(0.5))
    }
}

struct CountdownHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        RootContainerView()
    }
}
