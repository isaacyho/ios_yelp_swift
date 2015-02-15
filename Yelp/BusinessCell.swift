//
//  BusinessCell.swift
//  Yelp
//
//  Created by Isaac Ho on 2/13/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
    @IBOutlet weak var ratingsImage: UIImageView!

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var numReviewsLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func displayBusiness( b: Business, indexPath: NSIndexPath ) {
        let METERS_PER_MILE = 1609.34
        self.ratingsImage.setImageWithURL( NSURL( string: b.ratingImgURL ) )
        self.categoriesLabel.text = b.categories
        self.addressLabel.text = b.address
        self.numReviewsLabel.text = String( format: "%d reviews", b.numReviews )
        self.distanceLabel.text = String( format: "%.1f mi", b.distance / METERS_PER_MILE )
        self.mainImage.setImageWithURL( NSURL( string: b.imgURL ) )
        self.nameLabel.text = "\(indexPath.row + 1). \(b.name)"
        self.categoriesLabel.text = b.categories
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
