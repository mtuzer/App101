//
//  UIImageViewExtension.swift
//  App101
//
//  Created by Mert Tuzer on 30.01.2020.
//  Copyright © 2020 Mert Tuzer. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadImageFromURLString(urlString: String) {
        if let image = imageCache.object(forKey: urlString as NSString) {
            self.image = image
            return
        }
        let url = URL(string: urlString)!
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                print("XXX")
                return
            }
            DispatchQueue.main.async {
                let imageToBeCached = UIImage(data: data!)
                if let imageNotNil = imageToBeCached {
                    imageCache.setObject(imageNotNil, forKey: urlString as NSString)
                    self.image = imageNotNil
                } else {
                    self.image = nil
                }
            }
        }.resume()
    }
}
