//
//  Data.swift
//  Interview Practice
//
//  Created by Lu Ao on 6/21/17.
//  Copyright © 2017 Lu Ao. All rights reserved.
//

import Foundation

class Data: NSObject{
    
    private(set) var id = String()
    private(set) var hours = String()
    private(set) var url = String()
    private(set) var descriptions = String()
    private(set) var title = String()
    private(set) var popular = String()
    private(set) var new = String()
    private(set) var rating = String()
    private(set) var n_reviews = String()
    private(set) var price_range = String()
    
    init(_ serverObject: AnyObject){
        self.id = serverObject[keys.id] as! String
        self.hours = serverObject[keys.hours] as! String
        self.url = serverObject[keys.url] as! String
        self.descriptions = serverObject[keys.description] as! String
        self.title = serverObject[keys.title] as! String
        self.popular = String(describing: serverObject[keys.popular] as! Int)
        self.new = String(describing: serverObject[keys.new] as! Int)
        self.rating = String(describing: serverObject[keys.rating] as! Int)
        self.n_reviews = String(describing: serverObject[keys.n_reviews] as! Int)
        self.price_range = String(describing: serverObject[keys.price_range] as! Int)
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
