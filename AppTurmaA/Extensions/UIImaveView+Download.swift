//
//  UIImaveView+Download.swift
//  AppTurmaA
//
//  Created by Yago Marques on 03/08/23.
//

import UIKit

extension UIImageView {
    func download(from imagePath: String) {
        var url = URL(string: "https://image.tmdb.org/t/p/w500")!
        url.append(path: imagePath)

        URLSession.shared.dataTask(with: .init(url: url)) { data, _, error in
            if error != nil { return }

            if let data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            } else { return }
        }.resume()
    }
}

