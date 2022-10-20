//
//  CustomWidgetButton.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 20/10/22.
//

import SwiftUI

struct CustomWidgetButton: View {
    private var isiPad: Bool { UIDevice.current.userInterfaceIdiom == .pad }

    var body: some View {
        VStack {
            VStack {
                Spacer()
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 30, height: 30)
                Spacer()
                    .frame(height: 15)
                Text("Create Custom Widget")
                    .font(.title)
                    .multilineTextAlignment(.center)
                Spacer()


            }
            .frame(width: getWidth(), height: getWidth())
            .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 3))
            .padding([.leading, .trailing])
            .foregroundColor(.white)

            Text("Create Custom Widget")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .background(Color.black.opacity(0.2))
                .cornerRadius(10)
        }
        .frame(width: getWidth())
        .contentShape(Rectangle())
    }

    func getWidth() -> CGFloat {
        isiPad ? UIScreen.main.bounds.width / 5 : UIScreen.main.bounds.width / 2
    }
}

struct CustomWidgetButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomWidgetButton()
    }
}
