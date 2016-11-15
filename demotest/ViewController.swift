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
  
    @IBOutlet weak var login: TKTransitionSubmitButton!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    let bg = UIImageView(image: UIImage(named: "Login"))
    bg.frame = self.view.frame
    self.view.addSubview(bg)
    
    btn = TKTransitionSubmitButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width - 64, height: 44))
    btn.center = self.view.center
    btn.frame.bottom = self.view.frame.height - 60
    btn.setTitle("Sign in", for: UIControlState())
    btn.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 14)
    btn.addTarget(self, action: #selector(ViewController.onTapButton(_:)), for: UIControlEvents.touchUpInside)
    self.view.addSubview(btn)
    self.view.bringSubview(toFront: self.login)

  }

  @IBAction func onTapButton(_ button: TKTransitionSubmitButton) {
    button.animate(1, completion: { () -> () in
      let secondVC = self.storyboard!.instantiateViewController(withIdentifier: "timerView")
      secondVC.transitioningDelegate = self
      self.present(secondVC, animated: true, completion: nil)
    })
  }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: UIViewControllerTransitioningDelegate
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return TKFadeInAnimator(transitionDuration: 0.5, startingAlpha: 0.8)
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return nil
  }
  
}

