//
//  AppInfoView.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 16/10/22.
//

import SwiftUI

struct AppInfoView: View {
    @State var shouldShowAppInfo: Bool = false

    var body: some View {
        VStack {
            Text("Enjoying \(Bundle.main.displayName ?? "this") app or need some help?")
                .foregroundColor(.white)
            Button {
                shouldShowAppInfo = true
            } label: {
                Text("Tap Here")
                    .font(.title)
                    .bold()
            }
            .padding(10)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .sheet(isPresented: $shouldShowAppInfo, content: {
            AppInfoContainerView()
        })
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.black.opacity(0.5))
    }
}

struct AppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoView()
    }
}
