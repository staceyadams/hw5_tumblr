//
//  SearchViewController.swift
//  hw5_tumblr
//
//  Created by Stacey Adams on 3/3/15.
//  Copyright (c) 2015 Stacey Adams. All rights reserved.
//

import UIKit
import Foundation

class SearchViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loadingDots: UIImageView!
    @IBOutlet weak var searchFeedImage: UIImageView!
    var images = UIImage.animatedImageNamed("loading-", duration: 0.7)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = searchFeedImage.frame.size
        
        loadingDots.image = images
        searchFeedImage.hidden = true

        delay(2, { () -> () in
            self.loadingDots.stopAnimating()
            self.searchFeedImage.hidden = false
            self.loadingDots.hidden = true
        })
        
        
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
