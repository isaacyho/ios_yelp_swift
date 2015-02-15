//
//  SliderCell.swift
//  Yelp
//
//  Created by Isaac Ho on 2/14/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit
protocol SliderCellDelegate
{
    func sliderValueDidChange( cell:SliderCell, value:Double)
}
class SliderCell: UITableViewCell {
    @IBOutlet weak var slider: UISlider!
    let METERS_PER_MILE = 1609.34
    var delegate:SliderCellDelegate?
    
    @IBOutlet weak var txtLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func valueChanged(sender: AnyObject) {
        var pctValue = self.slider.value
        var numMiles = ( Double(pctValue) * 5000.0 / METERS_PER_MILE )
        self.txtLabel.text = NSString(format: "%.1f mi", numMiles )
        var numMeters = Double(self.slider.value) * 5000.0
        
        delegate!.sliderValueDidChange(self, value:numMeters)

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
