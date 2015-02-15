//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Isaac Ho on 2/13/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit


protocol FiltersViewControllerDelegate
{
    func filtersDidChange( newFilters: Filters )
}
class FiltersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SwitchCellDelegate, SegmentCellDelegate, SliderCellDelegate {
    var client: YelpClient? // cannot pass it during segue???
    var delegate: FiltersViewControllerDelegate?
    @IBAction func onApply(sender: AnyObject)
    {
        self.delegate!.filtersDidChange( filters )
    }
    let METERS_PER_MILE = 1609.34
    var filters: Filters!
    let yelpConsumerKey = "vxKwwcR_NMQ7WaEiQBK_CA"
    let yelpConsumerSecret = "33QCvh5bIF5jIHR5klQr7RtBDhQ"
    let yelpToken = "uRcRswHFYa1VkDrGV6LAW2F8clGh5JHV"
    let yelpTokenSecret = "mqtKIxMIR4iBtBPZCmCLEb-Dz3Y"
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        client = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
    }
    @IBOutlet weak var tableView: UITableView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch ( indexPath.section )
        {
        case 0:
            var cell = tableView.dequeueReusableCellWithIdentifier("com.codepath.switchcell") as SwitchCell
            cell.name.text = client!.categories[ indexPath.row ]["name"]
            cell.delegate = self
            cell.onOffSwitch.setOn( self.filters.categoryIdxs.containsObject( indexPath.row ), animated:false )
            return cell
        case 1:
            var cell = tableView.dequeueReusableCellWithIdentifier("com.codepath.segmentcell") as SegmentCell
            cell.delegate = self
            return cell
        case 2:
            var cell = tableView.dequeueReusableCellWithIdentifier("com.codepath.slidercell") as SliderCell
            var pctValue: Float = Float( filters.distanceInMeters ) / 5000.0 as Float
            cell.delegate = self
            
            cell.slider.setValue(pctValue, animated:false )
            cell.txtLabel.text = NSString(format: "%.1f mi", ( Double( filters.distanceInMeters ) / METERS_PER_MILE ) )
            return cell

        case 3:
            var cell = tableView.dequeueReusableCellWithIdentifier("com.codepath.switchcell") as SwitchCell
            cell.delegate = self
            cell.name.text = "Show only hot deals"
            cell.onOffSwitch.setOn( self.filters.showDealsOnly, animated:false )
            return cell
        default:
            assert( false )
        }
        
    }
    func sliderValueDidChange( cell: SliderCell, value:Double )
    {
        self.filters.distanceInMeters = value
    }
    func segmentValueDidChange( cell: SegmentCell, value:Int)
    {
        self.filters.sortByIdx = value
    }
    func switchValueDidChange( cell: SwitchCell, value:Bool )
    {
        var indexPath = self.tableView.indexPathForCell( cell )!
        switch( indexPath.section )
        {
        case 0:
            if ( value ) {
                filters.categoryIdxs.addObject( indexPath.row )
            }
            else {
                filters.categoryIdxs.removeObject( indexPath.row )
            }
        case 3:
            self.filters.showDealsOnly = value
        default: assert( false )
        }
        
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch( section )
        {
        case 0: return client!.categories.count
        default: return 1
        }
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch( section )
        {
        case 0: return "Categories"
        case 1: return "Sort by"
        case 2: return "Distance"
        case 3: return "Deals"
        default: assert( false )
        }
    }
     
}
