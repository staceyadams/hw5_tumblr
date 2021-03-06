//
//  ComposeViewController.swift
//  hw5_tumblr
//
//  Created by Stacey Adams on 3/3/15.
//  Copyright (c) 2015 Stacey Adams. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController , UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
    }


    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    // CUSTOM TRANSITION FOR COMPOSE VIEW
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

        
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting)
        {
            // Text Button Animation
            var textButtonStart = textButton.center.y + 700
            var textButtonEnd = textButton.center.y
            textButton.center.y = textButtonStart
            
            // Photo Button Animation
            var photoButtonStart = photoButton.center.y + 500
            var photoButtonEnd = photoButton.center.y
            photoButton.center.y = photoButtonStart
            
            // Quote Button Animation
            var quoteButtonStart = quoteButton.center.y + 870
            var quoteButtonEnd = quoteButton.center.y
            quoteButton.center.y = quoteButtonStart
            
            // Chat Button Animation
            var chatButtonStart = chatButton.center.y + 1000
            var chatButtonEnd = chatButton.center.y
            chatButton.center.y = chatButtonStart
            
            // Link Button Animation
            var linkButtonStart = linkButton.center.y + 1200
            var linkButtonEnd = linkButton.center.y
            linkButton.center.y = linkButtonStart
            
            // Video Button Animation
            var videoButtonStart = videoButton.center.y + 700
            var videoButtonEnd = videoButton.center.y
            videoButton.center.y = videoButtonStart
            
            UIView.animateWithDuration(0.5)
            { () -> Void in
                self.textButton.center.y = textButtonEnd
                self.photoButton.center.y = photoButtonEnd
                self.quoteButton.center.y = quoteButtonEnd
                self.chatButton.center.y = chatButtonEnd
                self.linkButton.center.y = linkButtonEnd
                self.videoButton.center.y = videoButtonEnd
            }
            
            
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                   fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()  //disable these because we still want the fromVC to still be visible
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func didPressNevermind(sender: AnyObject)
    {
        dismissViewControllerAnimated(true, completion: nil)
        
        
        // Text Button Animation
        var textButtonDismiss = textButton.center.y - 700
        var photoButtonDismiss = photoButton.center.y - 600
        var quoteButtonDismiss = quoteButton.center.y - 800
        var linkButtonDismiss = linkButton.center.y - 1100
        var chatButtonDismiss = chatButton.center.y - 900
        var videoButtonDismiss = videoButton.center.y - 1200

        UIView.animateWithDuration(0.6)
        { () -> Void in
            self.textButton.center.y = textButtonDismiss
            self.photoButton.center.y = photoButtonDismiss
            self.quoteButton.center.y = quoteButtonDismiss
            self.linkButton.center.y = linkButtonDismiss
            self.chatButton.center.y = chatButtonDismiss
            self.videoButton.center.y = videoButtonDismiss
        }

    
    }

}
