//
//  ImageCropViewController.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 20/10/22.
//

import Foundation
import SwiftUI
import UIKit
import CropViewController
import TOCropViewController

struct ImageCropViewController: UIViewControllerRepresentable {

    @Environment(\.presentationMode) private var presentationMode
    let onImageCropped: (UIImage) -> Void
    @Binding var image: UIImage?
    @Binding var viewerShown: Bool

    func makeCoordinator() -> Coordinator {
        Coordinator(onDismiss: { self.viewerShown = false }, onImageCropped: onImageCropped)
    }

    func makeUIViewController(context: Context) -> some UIViewController {
        let cropViewController = CropViewController(image: image!)
        cropViewController.aspectRatioLockEnabled = true
        cropViewController.aspectRatioPreset = .presetSquare
        cropViewController.allowedAspectRatios = [.presetSquare]
        cropViewController.delegate = context.coordinator
        return cropViewController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }

    class Coordinator: NSObject, CropViewControllerDelegate {

        private let onDismiss: () -> Void
        private let onImageCropped: (UIImage) -> Void

        init(onDismiss: @escaping () -> Void, onImageCropped: @escaping ( UIImage) -> Void) {
            self.onDismiss = onDismiss
            self.onImageCropped = onImageCropped
        }

        func cropViewController(_ cropViewController: CropViewController, didCropImageToRect rect: CGRect, angle: Int) {
            print("New image ")
            print("New image at ratio = \(cropViewController.aspectRatioPreset)")

        }

        func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
            print("New image = \(image) at ratio = \(cropViewController.aspectRatioPreset.rawValue)")
            onImageCropped(image)
            onDismiss()
        }

        func cropViewController(_ cropViewController: CropViewController, didFinishCancelled cancelled: Bool) {
            onDismiss()
        }
    }
}
