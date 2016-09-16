//
//  ViewController.swift
//  demotest
//
//  Created by zizhe on 8/2/16.
//  Copyright © 2016 zizhe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
  
  var btn: TKTransitionSubmitButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    let bg = UIImageView(image: UIImage(named: "Login"))
    bg.frame = self.view.frame
    self.view.addSubview(bg)
    
    btn = TKTransitionSubmitButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width - 64, height: 44))
    btn.center = self.view.center
    btn.frame.bottom = self.view.frame.height - 60
    btn.setTitle("Sign in", forState: .Normal)
    btn.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 14)
    btn.addTarget(self, action: #selector(ViewController.onTapButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    self.view.addSubview(btn)

  }
  
  @IBAction func onTapButton(button: TKTransitionSubmitButton) {
    button.animate(1, completion: { () -> () in
      let secondVC = TimerViewController()
      secondVC.transitioningDelegate = self
      self.presentViewController(secondVC, animated: true, completion: nil)
    })
  }

  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: UIViewControllerTransitioningDelegate
  func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return TKFadeInAnimator(transitionDuration: 0.5, startingAlpha: 0.8)
  }
  
  func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return nil
  }
  
}

