//
//  Extensions.swift
//  ReactiveBind
//
//  Created by Nader Besada on 2018-06-22.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import UIKit

extension UIImageView {
    func image(with url: String){
        guard let createdUrl = URL(string: url) else { return }
        let request = URLRequest(url: createdUrl)
        let session = URLSession.shared
        let datatask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
            }
            DispatchQueue.main.async {
                guard let data = data else { return }
                self.image = UIImage(data: data)
            }
        }
        datatask.resume()
    }
}
