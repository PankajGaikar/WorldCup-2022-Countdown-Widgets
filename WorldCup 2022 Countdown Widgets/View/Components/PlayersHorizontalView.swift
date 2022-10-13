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
                        WidgetView(imagePath: player.imageUrl)
                            .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2)
                        .cornerRadius(10)

                        Text(player.name)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(10)
                    }
                    .frame(width: UIScreen.main.bounds.width / 2)
                }

            }
            .padding(.leading)
        }
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
