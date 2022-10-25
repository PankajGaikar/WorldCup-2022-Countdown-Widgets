//
//  CountriesHorizontalView.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 13/10/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct CountriesHorizontalView: View {
    private var isiPad: Bool { UIDevice.current.userInterfaceIdiom == .pad }

    var body: some View {
        Text("Countries Widgets Preview - Countries")
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
                ForEach(Country.allCases, id: \.self) { country in

                    VStack {
                        ZStack(alignment: .bottomLeading) {
                            VStack {
                                WebImage(url: URL(string: "https://github.com/PankajGaikar/Storage/blob/main/\(country.getImageName()).jpg?raw=true"))
                                    .resizable()
                                    .placeholder(content: {
                                        Image("WorldCup")
                                            .resizable()
                                            .shimmering()

                                    })
                                    .scaledToFill()

                                VStack {
                                    Text("Time to Qatar 2022")
                                        .font(.title2)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.2)
                                        .frame(maxWidth: .infinity)

                                    Text(WorldCupViewModel.getDate()!, style: .relative)
                                        .font(.largeTitle)
                                        .bold()
                                        .minimumScaleFactor(0.2)
                                        .lineLimit(1)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal, 5)
                                }
                                .foregroundColor(.white)
                                .padding(.horizontal, 10)
                            }
                        }
                        .frame(height: getWidth())
                        .background(Color.black.opacity(0.4))
                        .cornerRadius(10)

                        Text(country.getCountryName())
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
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

struct CountriesHorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesHorizontalView()
    }
}
