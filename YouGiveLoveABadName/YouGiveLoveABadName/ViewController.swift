//
//  ViewController.swift
//  YouGiveLoveABadName
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    var imageIsOriginalSize = true
    override func viewDidLoad() {
        super.viewDidLoad()
        image.center = view.center
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        switch imageIsOriginalSize{
        case true:
            imageIsOriginalSize = grow(sender)
        case false:
            imageIsOriginalSize = shrink(sender)
        }
    }
    
    func grow (_ sender: UITapGestureRecognizer)->Bool{
        let myView = sender.view!
        let screenHeight = self.view.bounds.height
        let startingHeight = myView.frame.height
        let duration = 1.0
        let bounceTime = 0.2
        let growTime = duration - 2 * (bounceTime)
        let squeezeDepth = -0.02 * startingHeight
        let bounceHeight = 1.02 * screenHeight
        print ("animating with dur \(duration) bounceTime\(0.2) growTime\(growTime)")
        UIView.animateKeyframes(withDuration: duration,delay: 0, options: [.calculationModeCubic],
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0,relativeDuration: bounceTime, animations: {
                                        myView.bounds.size.height.add(squeezeDepth)
                                        self.image.center = self.view.center
                                        print (myView)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: bounceTime, relativeDuration: growTime, animations: {
                                        myView.frame.size.height.add(bounceHeight - squeezeDepth)
                                        self.image.center = self.view.center
                                        print (myView)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: growTime + bounceTime, relativeDuration: bounceTime, animations: {
                                        myView.frame.size.height.add(-0.2 * screenHeight)
                                        self.image.center = self.view.center
                                    })
                                    
        }
            , completion: nil)
        return false
    }
    
    func shrink ( _ sender: UITapGestureRecognizer)->Bool{
        let myView = sender.view!
        let screenHeight = self.view.bounds.height
        let startingHeight = myView.frame.height
        let duration = 1.0
        let bounceTime = 0.2
        let growTime = duration - 2 * (bounceTime)
        let squeezeDepth = -0.02 * startingHeight
        let bounceHeight = 1.02 * screenHeight
        print ("animating with dur \(duration) bounceTime\(0.2) growTime\(growTime)")
        UIView.animateKeyframes(withDuration: duration,delay: 0, options: [.calculationModeCubic],
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: bounceTime, animations: {
                                        myView.frame.size.height.add(0.2 * screenHeight)
                                        self.image.center = self.view.center
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: bounceTime, relativeDuration: growTime, animations: {
                                        myView.frame.size.height.add(squeezeDepth - bounceHeight)
                                        self.image.center = self.view.center
                                        print (myView)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: growTime + bounceTime,relativeDuration: bounceTime, animations: {
                                        myView.bounds.size.height.add(0 - squeezeDepth)
                                        self.image.center = self.view.center
                                        print (myView)
                                    })
                                    
        }
            , completion: nil)
        return true
    }


}
