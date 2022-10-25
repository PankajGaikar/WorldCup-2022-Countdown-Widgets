//
//  HomeWidgetView_CountryRectangle.swift
//  WorldCupCountdownExtension
//
//  Created by Pankaj Gaikar on 20/10/22.
//

import SwiftUI

struct HomeWidgetView_CountryRectangle: View {
    var image: UIImage

    var body: some View {
        HStack {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()

            VStack {
                Text("Time to Qatar 2022")
                    .font(.title2)
                    .lineLimit(3)
                    .minimumScaleFactor(0.2)
                    .frame(maxWidth: .infinity)

                Text(WorldCupViewModel.getDate()!, style: .relative)
                    .font(.largeTitle)
                    .bold()
                    .minimumScaleFactor(0.2)
                    .lineLimit(3)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 5)
            }
            .padding(.horizontal, 10)
        }
    }
}
