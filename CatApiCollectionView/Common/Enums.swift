//
//  Enums.swift
//  CatApiCollectionView
//
//  Created by Mike Saradeth on 3/30/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation

enum SectionName: Int {
    case all = 0
    case png = 1
    case jpg = 2
    case gif = 3
}

enum APIError: Error {
    case parseJSONError
}

enum FileExt {
    static let jpg = "jpg"
    static let png = "png"
    static let gif = "gif"
}

enum ApiConstant {
    static let apiKey = "21a25674-3630-4395-8a64-9057ee4edd6d"
    static let baseURLPath = "https://api.thecatapi.com/v1/images/search?"
    static let userId = "tldnpr"
    static var authenticationToken: String?
    static let headers = ["x-api-key":ApiConstant.apiKey]
}

