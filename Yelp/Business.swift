//
//  Business.swift
//  Yelp
//
//  Created by Isaac Ho on 2/13/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import Foundation

class Business: Printable
{
    var name = ""
    var imgURL: String = ""
    var ratingImgURL: String = ""
    var address = ""
    var categories = ""
    var distance: Double = 0
    var numReviews = 0

    var description: String {
        return "\(name) imgURL:\(imgURL) ratingURL:\(ratingImgURL) addr:\(address) categories:\(categories) dist:\(distance)"
    }
    
    // build from yelps returned json
    class func createFromJSON( dataFromServer: AnyObject ) -> Array<Business>
    {
        let METERS_PER_MILE = 1609.34

        let json = JSON(dataFromServer)
        println( "JSON: \(json)" )
     
        var newBusinesses = Array<Business>()
        for (key: String, businessJson: JSON ) in json["businesses"] {
            var newBusiness = Business()
            newBusiness.name = businessJson["name"].string!
            newBusiness.imgURL = businessJson["image_url"].string!
            newBusiness.ratingImgURL = businessJson["rating_img_url"].string!
            newBusiness.numReviews = businessJson["review_count"].int!
            newBusiness.distance = businessJson["distance"].double!
            var addr = businessJson["location"]["address"]
            if ( addr != nil ) {
              if ( addr.count > 0 ) {
                newBusiness.address = businessJson["location"]["address"][0].string!
              }
            }
            let neighborhoods = businessJson["location"]["neighborhoods"]

            if ( neighborhoods != nil && neighborhoods.count > 0 )
            {
                if ( countElements( newBusiness.address ) > 0 ) { newBusiness.address += ", " }
            
                newBusiness.address += neighborhoods[0].string!
            }
            var categories = businessJson["categories"]
            var firstTime = true
            newBusiness.categories = ""
            for (key: String, cWrapper: JSON) in categories {
                if ( !firstTime ) {
                    newBusiness.categories += ", "
                } else {
                    firstTime = false
                }
               newBusiness.categories += cWrapper[0].string!
            }
            println( "+++ \(newBusiness)" )
            newBusinesses.append( newBusiness )
            
        }
        return( newBusinesses )
    }
}