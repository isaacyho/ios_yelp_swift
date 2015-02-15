//
//  SwitchCell.swift
//  Yelp
//
//  Created by Isaac Ho on 2/13/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

protocol SwitchCellDelegate
{
    func switchValueDidChange( changedCell: SwitchCell, value:Bool)
}

class SwitchCell: UITableViewCell {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var onOffSwitch: UISwitch!
    var delegate: SwitchCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.name.preferredMaxLayoutWidth = frame.size.width
        // Initialization code
    }
    override func layoutSublayersOfLayer(layer: CALayer!) {
        self.name.preferredMaxLayoutWidth = frame.size.width
    }
    @IBAction func switchChanged(sender: AnyObject)
    {
        delegate!.switchValueDidChange( self, value: onOffSwitch.on )
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
