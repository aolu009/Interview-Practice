//
//  CollectionViewCell.swift
//  Interview Practice
//
//  Created by Lu Ao on 6/21/17.
//  Copyright © 2017 Lu Ao. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var data: Data?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        self.imageView.image = nil
    }
    
    struct keys {
        static var nibName = "CollectionViewCell"
    }
}
