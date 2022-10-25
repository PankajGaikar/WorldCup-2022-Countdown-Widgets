//
//  CustomWidgetButton.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 20/10/22.
//

import SwiftUI
import ImagePickerView

struct CustomWidgetButton: View {
    private var isiPad: Bool { UIDevice.current.userInterfaceIdiom == .pad }
    @State var isImagePickerViewPresented = false
    @State private var showImageCropper = false
    @State var imagePicked: UIImage?
    @State var alertIsPresented: Bool = false
    @State var text: String? // this is updated as the user types in the text field

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
        .onTapGesture {
            alertIsPresented = true
        }
        .onChange(of: text, perform: { newValue in
            isImagePickerViewPresented = true
        })
        .sheet(isPresented: $isImagePickerViewPresented) {
            // filter default is .images; please DO NOT CHOOSE .videos
            // selectionLimit default is 1; set to 0 to have unlimited selection
            ImagePickerView(filter: .any(of: [.images, .livePhotos]), selectionLimit: 1, delegate: ImagePickerView.Delegate(isPresented: $isImagePickerViewPresented, didCancel: { (phPickerViewController) in
                print("Did Cancel: \(phPickerViewController)")
            }, didSelect: { (result) in
                let phPickerViewController = result.picker
                let images = result.images
                print("Did Select images: \(images) from \(phPickerViewController)")
                self.imagePicked = result.images.first
                DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: {
                    self.showImageCropper = true
                })
            }, didFail: { (imagePickerError) in
                let phPickerViewController = imagePickerError.picker
                let error = imagePickerError.error
                print("Did Fail with error: \(error) in \(phPickerViewController)")
            }))
        }
        .sheet(isPresented: $showImageCropper) {
            ImageCropViewController(onImageCropped: { image in

            }, image: $imagePicked, viewerShown: $showImageCropper)
        }
        .textFieldAlert(isPresented: $alertIsPresented) { () -> TextFieldAlert in
            TextFieldAlert(title: "Alert Title", message: "Alert Message", text: self.$text)
        }
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
