//
//  ImageView+Extension.swift
//  Phunware_CodeChallenge
//
//  Created by Reema Rachel Varghese on 12/18/21.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func setImage(urlString: String, placeholder: UIImage? = nil) {
        guard let url = URL(string: urlString) else { return }
        
        image = placeholder
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil, let data = data else { return }
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
                if let imageToCache = UIImage(data: data) {
                    imageCache.setObject(imageToCache, forKey: urlString as NSString)
                    self.image = imageToCache
                }
           }
        }.resume()
    }
    
}

