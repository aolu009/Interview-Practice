//
//  Client.swift
//  Interview Practice
//
//  Created by Lu Ao on 6/20/17.
//  Copyright © 2017 Lu Ao. All rights reserved.
//

import Foundation


class DataClient{
    static let sharedInstance = DataClient()
    private init() {}
    
    /** Fetch Data from server using REST API GET */
    internal func getData(success:@escaping (Data) -> Void, fail: () -> Void){
        let urlString = "https://fetchy-interview.herokuapp.com/api/placedata"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
        let task : URLSessionDataTask = session.dataTask(with: request) { (dataOrNil, response, error) in
            if let data = dataOrNil{
                if let reponseDictionary = try? JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary{
                    success(Data.init(reponseDictionary))
                }else{
                    print("error")
                }
            }
        }
        task.resume()
    }
}
