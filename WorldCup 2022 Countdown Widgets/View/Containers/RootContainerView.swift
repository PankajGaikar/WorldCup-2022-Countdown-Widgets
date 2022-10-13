//
//  ContentView.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 02/10/22.
//

import SwiftUI

struct RootContainerView: View {

    @ObservedObject var viewModel = WorldCupViewModel.shared

    var body: some View {
            ScrollView {
                VStack {
                    CountdownHeaderView()
                    SignatureWidgetHorizontalView()
                    PlayersHorizontalView()
                    CountriesHorizontalView()
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
