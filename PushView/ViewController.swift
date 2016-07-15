//
//  ViewController.swift
//  PushView
//
//  Created by HuuLuong on 7/15/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image_logo: UIImageView!
    
    @IBOutlet weak var btn_play: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image_logo!.alpha = 0
        btn_play.hidden = true
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animateWithDuration(4, animations: {
            self.image_logo!.alpha = 1
        }) { (finished) in
            UIView.animateWithDuration(3, animations: {
                    self.btn_play!.center = CGPointMake(self.image_logo!.center.x, 130)
                    self.btn_play.hidden = false
                })
        }
    }
    
    @IBAction func action_nextViewLogin(sender: AnyObject) {
        let v2 = self.storyboard?.instantiateViewControllerWithIdentifier("V2") as! View2
        
        self.navigationController?.pushViewController(v2, animated: true)
    }
    
}

