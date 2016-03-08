//
//  userViewController.swift
//  myInstagram
//
//  Created by Erica Lee on 3/6/16.
//  Copyright © 2016 Erica Lee. All rights reserved.
//

import UIKit
import Parse

class userViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var posts: [PFObject]?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        print("in Login View Controller")
        requestPosts(nil)
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refreshControlAction:", forControlEvents: UIControlEvents.ValueChanged)

        // Do any additional setup after loading the view.
    }

   /* func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        //let tweet = tweets![indexPath.row]
        performSegueWithIdentifier("detailViewController", sender: tweet)
        
    }
    */
    

    @IBAction func onLogout(sender: AnyObject) {
        PFUser.logOut()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            let cell = tableView.dequeueReusableCellWithIdentifier("photoCell", forIndexPath: indexPath) as! photoCell
            if let posts = posts {
                let post = posts[indexPath.row]
                
                //retrieve photo
                let file = post["media"] as? PFFile
                file?.getDataInBackgroundWithBlock({ (data, error) -> Void in
                    cell.photo.image = UIImage(data: data!)
                    cell.captionLabel.text = post["caption"] as? String
                })
            }
            else{
                print("no posts yet!")
            }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if posts != nil{
            return posts!.count
        }
        else {
            return 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func requestPosts(completion: (()-> Void)? ) {
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20

        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) -> Void in
            if let media = media {
                self.posts = media
                self.tableView.reloadData()
                if let completion = completion {
                    completion()
                }
                // do something with the data fetched
            } else {
                // handle error
            }
        }
    }
    
    //from CodePath
    func refreshControlAction(refreshControl: UIRefreshControl) {
        requestPosts{ () -> Void in
            refreshControl.endRefreshing()
        }
        // ... Create the NSURLRequest (myRequest) ...
        
        // Configure session so that completion handler is executed on main UI thread
        
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
