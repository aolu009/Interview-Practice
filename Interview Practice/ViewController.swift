//
//  ViewController.swift
//  Interview Practice
//
//  Created by Lu Ao on 6/20/17.
//  Copyright © 2017 Lu Ao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DataClient.sharedInstance.getData(success: { (Data) in
            for info in Data.dataDictionary{
                print(info)
            }
        }) { 
            print("fail")
        }
        
    }

}

