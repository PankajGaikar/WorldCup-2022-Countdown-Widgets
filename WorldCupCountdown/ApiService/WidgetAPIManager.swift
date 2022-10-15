//
//  ApiService.swift
//  WorldCup 2022 Countdown Widgets
//
//  Created by Pankaj Gaikar on 14/10/22.
//

import Foundation
import UIKit
import AVFoundation

typealias ImageCompletionHandler = (_ image: UIImage?) -> Void

class WidgetAPIManager {

    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

    func downloadImage(from imagePath: String, completion: @escaping ImageCompletionHandler) {
        print("Download Started")
        guard let url = URL(string: "https://github.com/PankajGaikar/Storage/blob/main/\(imagePath).jpg?raw=true") else { return }

        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            completion(UIImage(data: data))
        }
    }

}
