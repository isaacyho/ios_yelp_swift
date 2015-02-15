//
//  SegmentCell.swift
//  Yelp
//
//  Created by Isaac Ho on 2/14/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

protocol SegmentCellDelegate
{
    func segmentValueDidChange( changedCell:SegmentCell, value:Int)
}

class SegmentCell: UITableViewCell {
    var delegate: SegmentCellDelegate?
    
    @IBOutlet weak var segControl: UISegmentedControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func valueChanged(sender: AnyObject) {
        delegate!.segmentValueDidChange( self, value: segControl.selectedSegmentIndex )

    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
