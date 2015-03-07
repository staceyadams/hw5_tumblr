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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = searchFeedImage.frame.size
        
        loadingDots.animationImages = [UIImage]()
        for var index = 1; index < 4; index++
        {
            var frameName = String(format: "loading-%01d", index)
            loadingDots.animationImages?.append(UIImage(named: frameName)!)
        }
        
        loadingDots.animationDuration = 1
        loadingDots.startAnimating()
        searchFeedImage.hidden = true
        
        // hacky delay. why doesn't using delay work?
        UIView.animateWithDuration(2.5, animations: { () -> Void in
            self.loadingDots.alpha = 0.99
        })  { (finished: Bool) -> Void in
            self.loadingDots.stopAnimating()
            self.searchFeedImage.hidden = false
            self.loadingDots.hidden = true
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
