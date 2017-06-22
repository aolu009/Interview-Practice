//
//  Extensions.swift
//  Interview Practice
//
//  Created by Lu Ao on 6/21/17.
//  Copyright © 2017 Lu Ao. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    internal func setImage(withUrl: String){
        var image: UIImage?
        let url = URL(string: withUrl)!
        let request = URLRequest(url: url)
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
        let task: URLSessionDataTask = session.dataTask(with: request) { (dataOrNil, response, error) in
            if let data = dataOrNil{
                image = UIImage.init(data: data)
                DispatchQueue.main.async() { () -> Void in
                    self.image = image
                }
            }
        }
        task.resume()
    }
}
