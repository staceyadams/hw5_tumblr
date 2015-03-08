//
//  TabBarViewController.swift
//  hw5_tumblr
//
//  Created by Stacey Adams on 3/3/15.
//  Copyright (c) 2015 Stacey Adams. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var exploreBobble: UIImageView!
    @IBOutlet weak var contentView: UIView!
    // hook up buttons as an outlet collection:
    @IBOutlet var buttons: [UIButton]!
    var viewControllersArray = [UIViewController]()
    var selectedIndex: Int! = 0
    
    // reference the other VCs. We use UIViewController! instead of the VC file because of the array
    var homeVC: UIViewController!
    var searchVC: UIViewController!
    var composeVC: UIViewController!
    var accountVC: UIViewController!
    var trendingVC: UIViewController!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // create the view so content can be pulled into the tabVC
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeVC = storyboard.instantiateViewControllerWithIdentifier("homeStory") as UIViewController
        searchVC = storyboard.instantiateViewControllerWithIdentifier("searchStory") as UIViewController
        accountVC = storyboard.instantiateViewControllerWithIdentifier("accountStory") as UIViewController
        trendingVC = storyboard.instantiateViewControllerWithIdentifier("trendingStory") as UIViewController
        
        viewControllersArray = [homeVC, searchVC, accountVC, trendingVC]
        
        
        // show home as the default on initial load
        didPressTabButton(buttons[0])
        
        exploreBobbleAnimate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func didPressTabButton(sender: AnyObject)
    {
        // println(sender.tag) // verify the tags we set in the storyboard on the buttons
        
        // remove the stuff from the existing view
        removeChildView(viewControllersArray[selectedIndex]) // remove existing view before adding a new view. Uses func created below.
        buttons[selectedIndex].selected = false
        
        // set SelectedIndex to the current view (array number)
        selectedIndex = sender.tag
        
        // add in the new view
        buttons[selectedIndex].selected = true
        addChildViewController(viewControllersArray[selectedIndex]) // add new view
        var tabContentView = viewControllersArray[selectedIndex].view // sets size of content view
        tabContentView.frame = contentView.frame // sets size of content view to fit into container view
        contentView.addSubview(tabContentView) // get view from the content VC and put it into our container on the tab VC
        viewControllersArray[selectedIndex].didMoveToParentViewController(self) // attaches child VC to tab bar controller
        
        exploreBobble.hidden = (selectedIndex==1)
    
    }
    
    func removeChildView(content: UIViewController)
    {
        content.willMoveToParentViewController(nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }

    @IBAction func didPressCompose(sender: AnyObject)
    {
        performSegueWithIdentifier("composeSegue", sender: self)
    
    }
    
    func exploreBobbleAnimate()
    {
        // Animation with damping and velocity
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 40, options: nil, animations:
            { () -> Void in
            // set position of bobble
            self.exploreBobble.center.y = 490
            })
            { (finished: Bool) -> Void in
                // Here we use autoreverse and repeat to get the bobble motion
                UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.AllowUserInteraction, animations:
                    { () -> Void in
                    self.exploreBobble.center.y = 500
                    })
                    { (Bool) -> Void in
                    }
                
            }
    }

}
