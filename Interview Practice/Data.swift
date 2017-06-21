//
//  Data.swift
//  Interview Practice
//
//  Created by Lu Ao on 6/20/17.
//  Copyright © 2017 Lu Ao. All rights reserved.
//

import Foundation

class Data: NSObject{
    
    
    private(set) var dataDictionary = [[String:String]]()
    init(_ dictionary: NSDictionary){
        guard let data = dictionary["data"] else{return}
        let dataArr = data as! [AnyObject]
        for info in dataArr{
            var infoString = [String:String]()
            infoString[keys.id] = info[keys.id] as? String
            infoString[keys.hours] = info[keys.hours] as? String
            infoString[keys.url] = info[keys.url] as? String
            infoString[keys.description] = info[keys.description] as? String
            infoString[keys.title] = info[keys.title] as? String
            infoString[keys.popular] = String(describing: info[keys.popular] as? Int)
            infoString[keys.new] = String(describing: info[keys.new] as? Int)
            infoString[keys.rating] = String(describing: info[keys.rating] as? Int)
            infoString[keys.n_reviews] = String(describing: info[keys.n_reviews] as? Int)
            infoString[keys.price_range] = String(describing: info[keys.price_range] as? Int)
            dataDictionary.append(infoString)
        }
    }
    
    struct keys{
        static let id = "id" //"22217"
        static let hours = "hours"//: "Daily, 5:30 a.m. to 12:30 p.m.",
        static let url = "url"//: "https://s3.amazonaws.com/fetchy-ios-interview-2/22217",
        static let description = "description"//: "Books, magazines, newspapers and sundries",
        static let title = "title"//: "U.S. News & World Report",
        static let popular = "popular"//: 0,
        static let new = "new"//: 0,
        static let rating = "rating"//: 0,
        static let n_reviews = "n_reviews"//: 772,
        static let price_range = "price_range"//: 3
    }
}

