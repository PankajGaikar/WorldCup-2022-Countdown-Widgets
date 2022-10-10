//
//  WorldCupView.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 10/10/22.
//

import SwiftUI

struct WorldCupView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("WorldCup_1024")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Image("WorldCup_1024").resizable().scaledToFill())

            ZStack {
                VStack {
                    Text("Time to WorldCup")
                        .font(.body)
                        .lineLimit(1)
                        .minimumScaleFactor(0.2)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)

                    Text(WorldCupViewModel().getTimeToWorldCup())
                        .font(.title)
                        .bold()
                        .minimumScaleFactor(0.2)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 5)
                        .foregroundColor(.white)
                }
            }
            .background(Color.black.opacity(0.4))
        }
    }
}

struct WorldCupView_Previews: PreviewProvider {
    static var previews: some View {
        WorldCupView()
    }
}
