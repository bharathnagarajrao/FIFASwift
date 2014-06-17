//
//  ViewController.swift
//  FIFASwift
//
//  Created by Bharath Nagaraj Rao on 17/06/14.
//  Copyright (c) 2014 Bharath Nagaraj Rao. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet var countryNameSearchBar : UISearchBar
    @IBOutlet var countryNameTableView : UITableView
    
    var fifaTeams: String[] = []
    var searchResultsOfFifaTeams: String[] = []
    var indexOfSelectedTeam = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fifaTeams = ["Brazil", "Croatia", "Mexico", "Cameroon", "Spain", "Netherlands", "Chile", "Australia","Columbia", "Greece", "Ivory Coast", "Japan", "Uruguay", "Costa Rica", "England", "Italy","Switzerland", "Ecuador", "France", "Honduras", "Argentina", "Bosnia-Herzegovia", "Iran","Nigeria","Germany", "Portugal", "Ghana", "USA", "Belgium", "Algeria", "Russia", "Korea Republic"]
        
        //Search array is same as our original team array. It will change based on the search strings
        
        searchResultsOfFifaTeams = fifaTeams
        self.countryNameTableView.backgroundColor = UIColor(red: 255/255.0 , green: 0/255.0, blue: 0/255.0, alpha: 0.1)
        
        self.title = "Brazil 2014"
        self.navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.yellowColor()]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    //UITableView DataSource & Delegate methods
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        
        return searchResultsOfFifaTeams.count
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int
    {
        
        return 1;
        
    }
    
    func tableView(tableView: UITableView!,cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
        
    {
        
        var tableCell = tableView.dequeueReusableCellWithIdentifier("FifaTeamCell", forIndexPath: indexPath) as UITableViewCell!
        
        tableCell.textLabel.text = searchResultsOfFifaTeams[indexPath.row]
        
        tableCell.textLabel.textColor = UIColor.blackColor()
        
        tableCell.backgroundColor = UIColor.clearColor()
        
        return tableCell;
        
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        self.indexOfSelectedTeam = indexPath.row
        self.performSegueWithIdentifier("DetailsViewID", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)
        
    {
        
        if segue.identifier == "DetailsViewID"
            
        {
            
            let detailsViewController = segue.destinationViewController as DetailsViewController
            
            println("Selected country name - \(searchResultsOfFifaTeams[indexOfSelectedTeam])")
            
            detailsViewController.selectedteamName  = searchResultsOfFifaTeams[indexOfSelectedTeam]
            
            
            
            
        }
        
    }
    

    
    //UISearchBar Delegate methods
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar!) -> Bool // return NO to not become first responder
        
    {
        
        return true
        
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar!) // called when text starts editing
        
    {
        
    }
    
    func searchBarShouldEndEditing(searchBar: UISearchBar!) -> Bool // return NO to not resign first responder
        
    {
        
        return true
        
    }
    
    func searchBar(searchBar: UISearchBar!, textDidChange searchText: String!) // called when text changes (including clear)
        
    {
        
        //Remove all objects first.
        
        searchResultsOfFifaTeams.removeAll(keepCapacity: true)
        
        if(!searchText.isEmpty) {
            
            //If search string is available, search for matching team & add it in searchResultsOfFifaTeams
            
            searchTeamName(searchText)
            
        }else
            
        {
            
            //If search string is not available, initialise it back to fifaTeams
            
            searchResultsOfFifaTeams = fifaTeams
            
        }
        
        //reload the table
        
        countryNameTableView.reloadData()
        
    }
    
    func searchTeamName(searchText: String){
        
        for teamName in fifaTeams
            
        {
            
            if teamName.bridgeToObjectiveC().localizedCaseInsensitiveContainsString(searchText)
                
            {
                
                searchResultsOfFifaTeams.append(teamName)
                
            }
            
        }
        
    }
    
    
}

