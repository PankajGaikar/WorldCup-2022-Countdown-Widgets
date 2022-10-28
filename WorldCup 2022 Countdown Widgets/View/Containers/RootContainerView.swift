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
                        CountdownHeaderView_iPad()
                    } else {
                        CountdownHeaderView_iPhone()
                    }
                    SignatureWidgetHorizontalView()
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
