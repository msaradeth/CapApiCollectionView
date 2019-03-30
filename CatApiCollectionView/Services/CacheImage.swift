//
//  CacheImage.swift
//  CatApiCollectionView
//
//  Created by Mike Saradeth on 3/30/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit

class Cache: NSObject {
    static var image: [String:UIImage] = [:]
    static var isFavorite: [String:Bool] = [:]
}
