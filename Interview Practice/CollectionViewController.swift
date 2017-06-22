//
//  CollectionViewController.swift
//  Interview Practice
//
//  Created by Lu Ao on 6/21/17.
//  Copyright © 2017 Lu Ao. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private let cellClass = CollectionViewCell.self

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var datas = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Register cell classes
        self.collectionView!.register(cellClass, forCellWithReuseIdentifier: reuseIdentifier)

        setupDataSource()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        // Configure the cell
        cell.data = datas[indexPath.row]
        print(datas[indexPath.row].url)
        cell.imageView?.setImage(withUrl: datas[indexPath.row].url)
        
        return cell
    }
    
    func setupDataSource(){
        DataClient.sharedInstance.getFeeds { (serverDatas) in
            self.datas = serverDatas
            //self.collectionView?.insertItems(at: [IndexPath(row: 0, section: 0)])
            self.collectionView?.reloadData()
        }
    }
    
    
    // MARK: UICollectionViewDelegate
    /*
    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
