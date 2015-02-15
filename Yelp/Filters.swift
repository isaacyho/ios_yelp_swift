//
//  Filters.swift
//  Yelp
//
//  Created by Isaac Ho on 2/14/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import Foundation

class Filters
{
    let METERS_PER_MILE = 1609.34
    init() {
        self.categoryIdxs = NSMutableSet()
        self.showDealsOnly = false
        self.distanceInMeters = METERS_PER_MILE
        self.sortByIdx = 0
    }
    
    var categoryIdxs: NSMutableSet!
    var showDealsOnly: Bool!
    var distanceInMeters: Double
    var sortByIdx: Int!
}