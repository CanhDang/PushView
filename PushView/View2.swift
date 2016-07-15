//
//  View2.swift
//  PushView
//
//  Created by HuuLuong on 7/15/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import UIKit

class View2: UIViewController {

    
    @IBOutlet weak var tf_user: UITextField!
    
    @IBOutlet weak var tf_password: UITextField!
    
    var users = ["an": "1234", "tri": "2345", "hai": "12345"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func action_Pop(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    
    @IBAction func action_PushV2(sender: AnyObject) {
        let v3 = self.storyboard?.instantiateViewControllerWithIdentifier("V3") as! View3
        
        self.navigationController?.pushViewController(v3, animated: true)
    }
    
    @IBAction func action_login(sender: AnyObject) {
        if let password = users[tf_user.text!]{
            if password == tf_password.text! {
                let v3 = self.storyboard?.instantiateViewControllerWithIdentifier("V3") as! View3
                self.navigationController?.pushViewController(v3, animated: true)
                
            } else {
                print("Mat khau khong dung")
            }
            
        } else {
            print("Tai khoan khong ton tai")
        }
    }
    
    @IBAction func action_ListOfUsers(sender: AnyObject) {
        
        showListOfUsers()
    }
    
    func showListOfUsers(){
        var list: String = ""
        for user in users {
            list = list + user.0 + " " + user.1 + " " + "\n"
        }
        
        let alert = UIAlertController(title: "List of users", message: list, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    
    }
    
}
