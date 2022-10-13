//
//  SignatureWidgetHorizontalView.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 13/10/22.
//

import SwiftUI

struct SignatureWidgetHorizontalView: View {
    var body: some View {
        Text("Signature Widgets Preview")
            .font(.title3)
            .bold()
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.white)
            .background(Color.black.opacity(0.5))

        WidgetView(imageName: "WorldCup_1024")
        .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2)
    }
}

struct SignatureWidgetHorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        SignatureWidgetHorizontalView()
    }
}
