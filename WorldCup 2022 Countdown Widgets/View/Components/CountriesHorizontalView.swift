//
//  CountriesHorizontalView.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 13/10/22.
//

import SwiftUI

struct CountriesHorizontalView: View {
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
                        WidgetView(imagePath: country.getImageName())
                            .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2)
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
                    .frame(width: UIScreen.main.bounds.width / 2)
                }
            }
            .padding(.leading)
        }
    }
}

struct CountriesHorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesHorizontalView()
    }
}
