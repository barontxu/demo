//
//  MainViewController.swift
//  demotest
//
//  Created by zizhe on 9/18/16.
//  Copyright © 2016 zizhe. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    fileprivate var selectedIndex = 0
    fileprivate var transitionPoint: CGPoint!

    fileprivate var navigator: UINavigationController!
    lazy fileprivate var menuAnimator : MenuTransitionAnimator! = MenuTransitionAnimator(mode: .presentation, shouldPassEventsOutsideMenu: false) { [unowned self] in
        self.dismiss(animated: true, completion: nil)
    }
    
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier, segue.destination) {
        case (.some("presentMenu"), let menu as MenuViewController):
            menu.selectedItem = selectedIndex
            menu.delegate = self
            menu.transitioningDelegate = self
            menu.modalPresentationStyle = .custom
        case (.some("embedNavigator"), let navigator as UINavigationController):
            self.navigator = navigator
            self.navigator.delegate = self
            let detail = storyboard!.instantiateViewController(withIdentifier: "Timer")
            self.navigator.setViewControllers([detail], animated: false)
        default:
            super.prepare(for: segue, sender: sender)
        }
    }
}

extension MainViewController: MenuViewControllerDelegate {
    func menu(_: MenuViewController, didSelectItemAt index: Int, at point: CGPoint) {
        transitionPoint = point
        selectedIndex = index
        
        let detail = storyboard!.instantiateViewController(withIdentifier: "Info")
        let timer = storyboard!.instantiateViewController(withIdentifier: "Timer")

        
        if index % 2 == 0 {
            self.navigator.setViewControllers([detail, timer], animated: true)
        } else {
            self.navigator.setViewControllers([timer, detail], animated: true)
        }
        

        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func menuDidCancel(_: MenuViewController) {
        dismiss(animated: true, completion: nil)
    }
}

extension MainViewController: UINavigationControllerDelegate {
    func navigationController(_: UINavigationController, animationControllerFor _: UINavigationControllerOperation,
                              from _: UIViewController, to _: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if let transitionPoint = transitionPoint {
            return CircularRevealTransitionAnimator(center: transitionPoint)
        }
        return nil
    }
}

extension MainViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting _: UIViewController,
                                                   source _: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return menuAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MenuTransitionAnimator(mode: .dismissal)
    }
    
}
