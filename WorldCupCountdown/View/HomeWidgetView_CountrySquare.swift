//
//  HomeWidgetView_Square.swift
//  WorldCupCountdownExtension
//
//  Created by Pankaj Gaikar on 20/10/22.
//

import SwiftUI

struct HomeWidgetView_CountrySquare: View {
    var image: UIImage

    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()

            VStack {
                Text("Time to WorldCup")
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
            .padding(.horizontal, 10)
        }
    }
}
