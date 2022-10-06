//
//  ContentView.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 02/10/22.
//

import SwiftUI

struct RootContainerView: View {

    @ObservedObject var viewModel = WorldCupViewModel()

    var body: some View {
            ScrollView {
                VStack {
                    ZStack(alignment: .bottomLeading) {
                        Image("Background-Banner")
                            .resizable()
                            .scaledToFit()
                            .clipped()
                            .frame(maxWidth: .infinity)

                        VStack {
                            Text("Countdown to Qatar 2022")
                                .font(.largeTitle)
                                .bold()
                                .lineLimit(1)
                                .minimumScaleFactor(0.6)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)

                            if let components = viewModel.timeToWorldCup {
                                HStack {
                                    Spacer().frame(width: UIScreen.main.bounds.width * 0.12)

                                    TimeView(time: "\(components.day ?? -1)", unit: "DAYS")
                                    TimeView(time: "\(components.hour ?? -1)", unit: "HOURS")
                                    TimeView(time: "\(components.minute ?? -1)", unit: "MINUTES")
                                    TimeView(time: "\(components.second ?? -1)", unit: "SECONDS")

                                    Spacer().frame(width: UIScreen.main.bounds.width * 0.12)
                                }
                                .foregroundColor(.white)
                            }
                        }
                        .padding(10)
                        .background(Color.black.opacity(0.5))
                    }
                    .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.30, alignment: .center)

                    Text("Countries Widgets Preview - Countries")
                        .font(.title)
                        .bold()
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.5))

                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(Country.allCases, id: \.self) { country in

                                VStack {
                                    WidgetView(imageName: country.getImageName())
                                        .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2)

                                    Text(country.getCountryName())
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding(.horizontal)
                                        .padding(.bottom)
                                }
                                .background(Color.black.opacity(0.2))
                                .cornerRadius(10)
                            }
                        }
                        .padding(.leading)
                    }
                    Spacer()
                }
            }
            .background(Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootContainerView()
    }
}
