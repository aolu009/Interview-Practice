//
//  DetailScrollView.swift
//  Interview Practice
//
//  Created by Lu Ao on 6/22/17.
//  Copyright © 2017 Lu Ao. All rights reserved.
//

import UIKit

@objc protocol DetailScrollViewDelegate {
    @objc optional func deleTest(_ test: String)
}

class DetailScrollView: UIScrollView {
    
    var testDelegate: DetailScrollViewDelegate?
    
    override func awakeFromNib() {
        self.isHidden = true
        let frame1 = CGRect(x: 20, y: 20, width: 100, height: 45 )
        let button = UIButton(frame: frame1)
        button.setTitle("Close", for: [])
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(self.onButtonTap), for: .touchUpInside)
        self.addSubview(button)
    }
    
    @objc private func onButtonTap(){
        detailPagedown()
        testDelegate?.deleTest!("test")
        
    }
    private func detailPagedown(){
        self.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.bounds.size.height = 0
            self.bounds.size.width = 0
        }
    }
}
