//
//  CatViewModel.swift
//  CatApiCollectionView
//
//  Created by Mike Saradeth on 3/27/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import RxSwift


class CatViewModel: NSObject {
    let disposeBag = DisposeBag()
    var sections: [[Cat]]
    var catApiService: CatApiService
    
    init(sections: [[Cat]], catApiService: CatApiService) {
        self.sections = sections
        self.catApiService = catApiService
    }
    
    subscript(indexPath: IndexPath) -> Cat {
        return sections[indexPath.section][indexPath.row]
    }
    
    func loadData(completion: @escaping () -> Void) {
        catApiService.loadData()
            .subscribe(onSuccess: { [weak self] (sections) in
                guard let this = self else { return }
                this.sections = sections
                completion()
            }, onError: {error in
                print(error.localizedDescription)
                completion()
            })
            .disposed(by: disposeBag)
    }
    
    deinit {
        print("deinit - CatViewModel")
    }
}
