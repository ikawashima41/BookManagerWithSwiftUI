//
//  ImagePickerView.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/24.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//
import SwiftUI
import Combine
import UIKit

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var image: UIImage?

        init(image: Binding<UIImage?>) {
            _image = image
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            defer {
                picker.dismiss(animated: true)
            }

            guard let image = info[.originalImage] as? UIImage else {
                return
            }

            self.image = image
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }

    func makeCoordinator() -> ImagePickerView.Coordinator {
        let coordinator = Coordinator(image: $image)
        return coordinator
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.sourceType = .photoLibrary
        imagePickerViewController.delegate = context.coordinator
        return imagePickerViewController
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        // Nothing todo
    }
}
