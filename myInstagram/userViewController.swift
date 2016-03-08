//
//  userViewController.swift
//  myInstagram
//
//  Created by Erica Lee on 3/6/16.
//  Copyright © 2016 Erica Lee. All rights reserved.
//

import UIKit

class userViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var photos: [Post]?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

   /* func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        //let tweet = tweets![indexPath.row]
        performSegueWithIdentifier("detailViewController", sender: tweet)
        
    }
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            let cell = tableView.dequeueReusableCellWithIdentifier("photoCell", forIndexPath: indexPath) as! photoCell

        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if photos != nil{
            return photos!.count
        }
        else {
            return 0
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
