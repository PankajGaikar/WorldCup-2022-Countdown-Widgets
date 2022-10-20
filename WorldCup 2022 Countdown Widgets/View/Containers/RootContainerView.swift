//
//  ContentView.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 02/10/22.
//

import SwiftUI

struct RootContainerView: View {

    @ObservedObject var viewModel = WorldCupViewModel.shared
    private var isiPad: Bool { UIDevice.current.userInterfaceIdiom == .pad }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    if isiPad {
                        HStack {
                            Image("Background-Banner")
                                .resizable()
                                .scaledToFit()
                                .clipped()
                                .padding()
                                .cornerRadius(30)
                                .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.30, alignment: .center)

                            VStack {
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
                        }
                        .background(Color.black.opacity(0.5))
                    } else {
                        CountdownHeaderView()
                    }
                    //SignatureWidgetHorizontalView()
                    PlayersHorizontalView()
                    CountriesHorizontalView()
                    AppInfoView()
                    Spacer()
                }
            }
            .background(Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea().overlay(Color.black.opacity(0.6)))
            .ignoresSafeArea()
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootContainerView()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro"))
    }
}
