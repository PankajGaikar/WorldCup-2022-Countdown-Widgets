//
//  CountriesHorizontalView.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 13/10/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct PlayersHorizontalView: View {
    @ObservedObject var viewModel = WorldCupViewModel.shared
    private var isiPad: Bool { UIDevice.current.userInterfaceIdiom == .pad }

    var body: some View {
        Text("Players Widgets Preview - Countries")
            .font(.title3)
            .bold()
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.white)
            .background(Color.black.opacity(0.5))

        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModel.players) { player in

                    VStack {
                        WidgetView(imagePath: player.imagePath)
                            .frame(width: getWidth(), height: getWidth())
                        .cornerRadius(10)

                        Text(player.name)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(10)
                    }
                    .frame(width: getWidth())
                }

            }
            .padding(.leading)
        }
    }

    func getWidth() -> CGFloat {
        isiPad ? UIScreen.main.bounds.width / 5 : UIScreen.main.bounds.width / 2
    }
}

struct ContentView_Previews1: PreviewProvider {
    static var previews: some View {
        RootContainerView()
    }
}

struct PlayersHorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersHorizontalView()
    }
}
