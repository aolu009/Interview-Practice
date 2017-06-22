//
//  ViewController.swift
//  Interview Practice
//
//  Created by Lu Ao on 6/20/17.
//  Copyright © 2017 Lu Ao. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, DetailScrollViewDelegate{

    
    
    
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var detailScrollView: DetailScrollView!
    
    private(set) var datas = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupCollectionView()
        setupDataSource()
        detailScrollView.testDelegate = self
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        // Configure the cell
        cell.data = datas[indexPath.row]
        cell.imageView?.setImage(withUrl: datas[indexPath.row].url)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        detailPageUp()
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func deleTest(_ test: String) {
        print(test)
    }
    
    private func setupDataSource(){
        DataClient.sharedInstance.getFeeds { (serverDatas) in
            self.datas = serverDatas
            self.CollectionView.reloadData()
        }
    }
    
    private func setupCollectionView(){
        self.CollectionView.delegate = self
        self.CollectionView.dataSource = self
    }
    
    private func setupScrollView(){
        self.detailScrollView.bounds.size.height = 0
        self.detailScrollView.bounds.size.width = 0
    }
    
    private func detailPageUp(){
        self.detailScrollView.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.detailScrollView.bounds.size.height = 696
            self.detailScrollView.bounds.size.width = 374
        }
    }

}

