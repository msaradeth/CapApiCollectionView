//
//  Cat.swift
//  CatApiCollectionView
//
//  Created by Mike Saradeth on 3/27/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit

struct Cat: Codable {
    var id: String
    var url: String
    
    enum CodingKeys: CodingKey {
        case id
        case url
    }
}
