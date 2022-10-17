//
//  SignatureWidgetHorizontalView.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 13/10/22.
//

import SwiftUI

struct SignatureWidgetHorizontalView: View {
    private var isiPad: Bool { UIDevice.current.userInterfaceIdiom == .pad }

    var body: some View {
        VStack {
            Text("Signature Widgets Preview")
                .font(.title3)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
                .background(Color.black.opacity(0.5))

            WidgetView(imagePath: "WorldCup")
                .frame(width: getWidth(), height: getWidth())
        }
    }

    func getWidth() -> CGFloat {
        isiPad ? UIScreen.main.bounds.width / 5 : UIScreen.main.bounds.width / 2
    }
}

struct SignatureWidgetHorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        SignatureWidgetHorizontalView()
    }
}
