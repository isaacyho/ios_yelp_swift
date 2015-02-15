//
//  ViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 9/19/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, FiltersViewControllerDelegate {
    var client: YelpClient!
    var businessList = Array< Business >()
    // You can register for Yelp API keys here: http://www.yelp.com/developers/manage_api_keys
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    var filters: Filters!
    
    let yelpConsumerKey = "vxKwwcR_NMQ7WaEiQBK_CA"
    let yelpConsumerSecret = "33QCvh5bIF5jIHR5klQr7RtBDhQ"
    let yelpToken = "uRcRswHFYa1VkDrGV6LAW2F8clGh5JHV"
    let yelpTokenSecret = "mqtKIxMIR4iBtBPZCmCLEb-Dz3Y"
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        filters = Filters()
    }
     func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        println("begin edit")
    }

    @IBAction func unwindToHere( segue: UIStoryboardSegue )
    {
        println ("unwind to here" )
        self.tableView.reloadData()
    }
    func searchForResults2()
    {
        client.search( "cafe", categoryIdxs:filters.categoryIdxs, distance:NSString(format: "%.0f", filters.distanceInMeters ), sortByIdx:filters.sortByIdx, dealsAreOn:filters.showDealsOnly,
            success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                let jsonData = response
                self.businessList = Business.createFromJSON( jsonData )
                self.tableView.reloadData()
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }
        
        self.tableView.reloadData()
        
    }
    func searchForResults()
    {
        client.search( searchBar.text, categoryIdxs:filters.categoryIdxs, distance:NSString(format: "%.0f", filters.distanceInMeters ), sortByIdx:filters.sortByIdx, dealsAreOn:filters.showDealsOnly,
            success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                let jsonData = response
                self.businessList = Business.createFromJSON( jsonData )
                self.tableView.reloadData()
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }

        self.tableView.reloadData()
    }
    func filtersDidChange( newFilters: Filters )
    {
        filters = newFilters
        searchForResults()
    }
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchForResults()
    }
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return( businessList.count )
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("com.codepath.businesscell") as BusinessCell
        cell.displayBusiness( self.businessList[ indexPath.row ], indexPath: indexPath )
        
        // change the default margin of the table divider length
        if (cell.respondsToSelector(Selector("setPreservesSuperviewLayoutMargins:"))){
        cell.preservesSuperviewLayoutMargins = false
        }
        if (cell.respondsToSelector(Selector("setSeparatorInset:"))){
        cell.separatorInset = UIEdgeInsetsMake(0, 4, 0, 0)
        }
        if (cell.respondsToSelector(Selector("setLayoutMargins:"))){
        cell.layoutMargins = UIEdgeInsetsZero
        }
        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       var dest = segue.destinationViewController as FiltersViewController
       dest.delegate = self
        dest.filters = filters
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        client = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
        searchForResults()
        
        self.tableView.estimatedRowHeight = 100
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

