//
//  CatApiService.swift
//  CatApiCollectionView
//
//  Created by Mike Saradeth on 3/29/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import RxSwift

class CatApiService: NSObject {
    
    func loadData() -> Single<[[Cat]]> {
        return Single<[[Cat]]>.create { single -> Disposable in
            let baseURLPath = ApiConstant.baseURLPath
            var params:[String:String] = [:]
            params["limit"] = "100"
            params["mime_types"] = "all"
            
            HttpHelper.request(baseURLPath, method: .get, params: params, success: { (responseObj) in
                guard let data = responseObj.data else { single(.error(APIError.parseJSONError)); return }
                do {
                    let cats = try JSONDecoder().decode(Array<Cat>.self, from: data)
                    let jpgCat = Array(cats.filter({ $0.url.suffix(3) == FileExt.jpg }))
                    let pngCat = Array(cats.filter({ $0.url.suffix(3) == FileExt.png }))
                    let gifCat = Array(cats.filter({ $0.url.suffix(3) == FileExt.gif }))
                    let sections = [cats, jpgCat, pngCat, gifCat]
                    single(.success(sections))
                    
                }catch let error {
                    print(error.localizedDescription)
                    single(.error(APIError.parseJSONError))
                }
                
            }, failure: { (myError) in
                print(myError.localizedDescription)
                single(.error(myError))
            })
            return Disposables.create()
        }
    }
    
    
    deinit {
        print("deinit - CatApiService")
    }
}
