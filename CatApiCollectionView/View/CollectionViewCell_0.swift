//
//  CollectionViewCell_0.swift
//  CatApiCollectionView
//
//  Created by Mike Saradeth on 3/30/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class CollectionViewCell_0: UICollectionViewCell {
    static let cellIdentifier = "Cell"
    let isFavoriteImage = UIImage(named: "MyFavorite")
    let notFavoriteImage = UIImage(named: "NotMyFavorite")
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(item: Cat) {
        favoriteImageView.image = (Cache.isFavorite[item.id] ?? false) ? isFavoriteImage : notFavoriteImage
        if let image = Cache.image[item.id] {
            imageView.image = image
        }else {
            DispatchQueue.global().async {
                guard let imageURL = URL(string: item.url),
                    let imageData = try? Data(contentsOf: imageURL),
                    let image =  UIImage(data: imageData) else { return }
                Cache.image[item.id] = image
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }
    }
    
    deinit {
        print("deinit - CollectionViewCell")
    }
}

//guard let imageURL = URL(string: item.url),
//    let imageData = try? Data(contentsOf: imageURL),
//    let catImage =  UIImage(data: imageData)
