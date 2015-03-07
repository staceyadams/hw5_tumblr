//
//  TabBarViewController.swift
//  hw5_tumblr
//
//  Created by Stacey Adams on 3/3/15.
//  Copyright (c) 2015 Stacey Adams. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var homeTabButton: UIButton!
    @IBOutlet weak var searchTabButton: UIButton!
    @IBOutlet weak var composeTabButton: UIButton!
    @IBOutlet weak var accountTabButton: UIButton!
    @IBOutlet weak var trendingTabButton: UIButton!
   
    
    // reference the other VCs
    var homeVC: HomeViewController!
    var searchVC: SearchViewController!
    var composeVC: ComposeViewController!
    var accountVC: AccountViewController!
    var trendingVC: TrendingViewController!
    var currentVC: UIViewController!
    var currentTabButton: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // create the view so content can be pulled into the tabVC
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeVC = storyboard.instantiateViewControllerWithIdentifier("homeStory") as HomeViewController
        searchVC = storyboard.instantiateViewControllerWithIdentifier("searchStory") as SearchViewController
        composeVC = storyboard.instantiateViewControllerWithIdentifier("composeStory") as ComposeViewController
        accountVC = storyboard.instantiateViewControllerWithIdentifier("accountStory") as AccountViewController
        trendingVC = storyboard.instantiateViewControllerWithIdentifier("trendingStory") as TrendingViewController
        
        // show home as the default on initial load
        currentVC = trendingVC
        currentTabButton = trendingTabButton
        didPressTrending(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    @IBAction func didPressTabButton(sender: AnyObject)
//    {
//        if (sender: homeTabButton)
//        {
//            
//        }
//    }
    
    
    
    
    @IBAction func didPressHome(sender: AnyObject)
    {
        removeChildView(currentVC) // remove existing view before adding a new view. Uses func created below.
        currentTabButton.selected = false
        currentTabButton = homeTabButton
        currentTabButton.selected = true
        addChildViewController(homeVC) // add new view
        var homeView = homeVC.view // sets size of content view
        homeView.frame = contentView.frame // sets size of content view to fit into container view
        contentView.addSubview(homeView) // get view from blue VC and put it into our container on the tab VC
        homeVC.didMoveToParentViewController(self) // attaches child VC to tab bar controller (part 2)
        currentVC = homeVC // set this as the new current VC

    }
    
    @IBAction func didPressSearch(sender: AnyObject)
    {
        removeChildView(currentVC)
        currentTabButton.selected = false
        currentTabButton = searchTabButton
        currentTabButton.selected = true
        addChildViewController(searchVC)
        var searchView = searchVC.view
        searchView.frame = contentView.frame
        contentView.addSubview(searchView)
        searchVC.didMoveToParentViewController(self)
        currentVC = searchVC
    }
    
    @IBAction func didPressCompose(sender: AnyObject)
    {
        removeChildView(currentVC)
        currentTabButton.selected = false
        currentTabButton = composeTabButton
        currentTabButton.selected = true
        addChildViewController(composeVC)
        var composeView = composeVC.view
        composeView.frame = contentView.frame
        contentView.addSubview(composeView)
        composeVC.didMoveToParentViewController(self)
        currentVC = composeVC
    }
    
    @IBAction func didPressAccount(sender: AnyObject)
    {
        removeChildView(currentVC)
        currentTabButton.selected = false
        currentTabButton = accountTabButton
        currentTabButton.selected = true
        addChildViewController(accountVC)
        var accountView = accountVC.view
        accountView.frame = contentView.frame
        contentView.addSubview(accountView)
        accountVC.didMoveToParentViewController(self)
        currentVC = accountVC
    }
    
    @IBAction func didPressTrending(sender: AnyObject)
    {
        removeChildView(currentVC)
        currentTabButton.selected = false
        currentTabButton = trendingTabButton
        currentTabButton.selected = true
        addChildViewController(trendingVC)
        var trendingView = trendingVC.view
        trendingView.frame = contentView.frame
        contentView.addSubview(trendingView)
        trendingVC.didMoveToParentViewController(self)
        currentVC = trendingVC
    }
    
    
    func removeChildView(content: UIViewController)
    {
        content.willMoveToParentViewController(nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
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
