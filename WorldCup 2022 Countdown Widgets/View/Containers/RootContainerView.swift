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
                    //SignatureWidgetHorizontalView()
                    VStack {
                        Text("Your Custom Widgets")
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
                                CustomWidgetButton()
                            }
                        }
                    }
                    .padding(.leading)
                    
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
