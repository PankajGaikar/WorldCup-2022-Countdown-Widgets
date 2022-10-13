//
//  CountriesHorizontalView.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 13/10/22.
//

import SwiftUI

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
                ForEach(viewModel.playerNames, id: \.self) { player in

                    VStack {
                        WidgetView(imageName: player)
                            .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2)

                        Text(player)
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
    }
}

struct PlayersHorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersHorizontalView()
    }
}
