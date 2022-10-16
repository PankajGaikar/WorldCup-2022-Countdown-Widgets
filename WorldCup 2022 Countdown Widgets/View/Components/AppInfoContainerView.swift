//
//  AppInfoContainerView.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 16/10/22.
//

import SwiftUI

struct AppInfoContainerView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 50)
                Text("Need help? Have an idea? Want to know whats coming next? Let's chat on Twitter.")
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack {
                    VStack {
                        Text("@MePankajGaikar")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 5)
                        Text("My DMs are open.")
                            .frame(maxWidth: .infinity, alignment: .leading)

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    Text("Twitter")
                        .padding()
                        .foregroundColor(.red)
                        .frame(width: UIScreen.main.bounds.width * 0.25)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.red, lineWidth: 2))
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.black.opacity(0.5))
                .cornerRadius(10)

                Spacer()
                    .frame(height: 20)

                Text("Enjoying \(Bundle.main.displayName ?? "this") app?")
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack {
                    VStack {
                        Text("Write a review.")
                            .bold()
                            .padding(.bottom, 5)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Text("Appreciate my work by writing a review.")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Text("AppStore")
                        .padding()
                        .foregroundColor(.red)
                        .frame(width: UIScreen.main.bounds.width * 0.25)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.red, lineWidth: 2))
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.black.opacity(0.5))
                .cornerRadius(10)

                Spacer()
                    .frame(height: 20)

                //                Text("Feeling extra generous?")
                //                    .font(.title3)
                //                    .multilineTextAlignment(.leading)
                //                    .frame(maxWidth: .infinity, alignment: .leading)
                //
                //                Text("Cash tips are more than welcome.")
                //                    .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()
            }
            .padding()
            .foregroundColor(.white)
            .background(Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .overlay(Color.black.opacity(0.5)))
            .toolbar {
                Button("Done") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.white)
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct AppInfoContainerView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoContainerView()
    }
}
