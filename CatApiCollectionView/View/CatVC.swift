//
//  CatVC.swift
//  CatApiCollectionView
//
//  Created by Mike Saradeth on 3/27/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit
import RxSwift


class CatVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: CatViewModel!
    
    static func createWith(title: String, viewModel: CatViewModel) -> CatVC {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CatVC") as! CatVC
        vc.title = title
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        viewModel.loadData {
            self.collectionView.reloadData()
        }
    }
    

}


extension CatVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // get UICollectionViewFlowLayout from collectionViewLayout
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize() }
        let numberOfColumns: CGFloat = UIDevice.current.userInterfaceIdiom == .phone ? 1 : 2
        let availableWidth = collectionView.bounds.width - (flowLayout.sectionInset.left + flowLayout.sectionInset.right)
        
        let cellWidth = availableWidth / numberOfColumns
        return CGSize(width: cellWidth, height: 350)
    }
}


extension CatVC: UICollectionViewDelegate {
    
}

extension CatVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.sections.count > 0 ? viewModel.sections[0].count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell_0.cellIdentifier, for: indexPath) as! CollectionViewCell_0
        
        cell.configure(item: viewModel[indexPath])
        
        return cell
        
//        switch indexPath.section {
//        case SectionName.all.rawValue:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell_0.cellIdentifier, for: indexPath) as! CollectionViewCell_0
//            return cell.configure(item: viewModel[indexPath])
//            print("all")
//        case SectionName.jpg.rawValue:
//            print("jpg")
//        case SectionName.png.rawValue:
//            print("png")
//        case SectionName.gif.rawValue:
//            print("gif")
//        default:
//            print("default")
//        }
        
        
    }
    
}
