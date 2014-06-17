//
//  DetailsViewController.swift
//  FIFASwift
//
//  Created by Bharath Nagaraj Rao on 17/06/14.
//  Copyright (c) 2014 Bharath Nagaraj Rao. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var teamFlagImageView : UIImageView
    @IBOutlet var messageLabel : UILabel
    var selectedteamName:String?
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    init(coder aDecoder: NSCoder!)
    {
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.messageLabel.text = "We wish \(selectedteamName) to win FIFA World Cup 2014 !"
        setImagForSelectedTeam()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func  setImagForSelectedTeam()
        
    {
        
        teamFlagImageView.image = UIImage(named:selectedteamName)
        
    }
    


    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
