//
//  View3.swift
//  PushView
//
//  Created by HuuLuong on 7/15/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import UIKit

class View3: UIViewController {

    
    @IBOutlet weak var lbl_n1: UILabel!
    
    @IBOutlet weak var lbl_n2: UILabel!
    
    @IBOutlet weak var lbl_sign: UILabel!
    
    @IBOutlet weak var lbl_time: UILabel!
    
    @IBOutlet weak var lbl_score: UILabel!
    
    @IBOutlet weak var btn_ans1: UIButton!
  
    @IBOutlet weak var btn_ans2: UIButton!
    
    @IBOutlet weak var btn_ans3: UIButton!
    
    @IBOutlet weak var lbl_headText: UILabel!
    
    var time = 60
    
    var timer = NSTimer()
    
    let btn1 = 100;
    let btn2 = 50;
    let btn3 = 10;
    
    var score = 0
    
    var result: Int = 0
    
    var color: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        color = 1
        score = 0
        setRandom()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(num), userInfo: nil, repeats: true)
        
        var timer_text = NSTimer()
        timer_text = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(changeColor), userInfo: nil, repeats: true)
    
    }
    
    func changeColor() {
        if color > 3 {
            color = 1
        }
        switch color {
        case 1:
            lbl_headText.textColor = UIColor.blueColor()
            break
        case 2:
            lbl_headText.textColor = UIColor.redColor()
            break
        case 3:
            lbl_headText.textColor = UIColor.cyanColor()
            break
        default:
            lbl_headText.textColor = UIColor.brownColor()
        }
        color += 1
    }
    
    
    func num() {
        if time >= 0 {
            lbl_time.text = String(time)
            time -= 1
            lbl_score.text = String(score)
        } else {
            self.timer.invalidate()
            showAlertDialog_End()
        }
    }
    
    
    
    func showAlertDialog_End() {
        let alert = UIAlertController(title: "Game Over", message: "Do you want to play again", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: { (action) in self.restart()
            }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func restart() {
        time = 60;
        score = 0;
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(num), userInfo: nil, repeats: true)
    }
    
    
    func setRandom() {
        var random1 = Int(arc4random_uniform(9)+1)
        var random2 = Int(arc4random_uniform(9)+1)
        var randomSign = Int(arc4random_uniform(4))
        var randomPosition = Int(arc4random_uniform(3))
        
        if randomSign == 3 {
            random2 = setDivisor(random1);
        }
        
        lbl_n1.text = String(random1)
        lbl_n2.text = String(random2)
        
        switch randomSign {
        case 0:
            lbl_sign.text = "+"
        case 1:
            lbl_sign.text = "-"
        case 2:
            lbl_sign.text = "*"
        default:
            lbl_sign.text = "/"
        }
        
        checkResult(random1, numberB: random2, sign: randomSign, position: randomPosition)
        
    }
    
    func setDivisor(dividend: Int) -> Int{
        var divisor = 1;
        var count = 0; // to count number of divisor of dividend
        
        for index in 1...dividend {
            if dividend % index == 0 {
                count += 1
            }
        }
        
        var position = Int(arc4random_uniform(UInt32(count))+1)
        
        count = 0;
        for divisor in 1...dividend {
            if dividend % divisor == 0 {
                count += 1
                if count == position {
                    return divisor
                }
            }
        }
        
        return divisor
    }
    
    func checkResult(numberA: Int, numberB: Int, sign: Int, position: Int){
        
        switch sign {
        case 0:
            result = numberA + numberB
            break;
        case 1:
            result = numberA - numberB
            break;
        case 2:
            result = numberA * numberB
            break;
        default:
            result = numberA / numberB
        }
        
        var randomNumber1 = Int(arc4random_uniform(80)+1)
        while randomNumber1 == result {
            randomNumber1 = Int(arc4random_uniform(80)+1)
        }
        
        var randomNumber2 = Int(arc4random_uniform(80)+1)
        while (randomNumber2 == result) || (randomNumber2 == result) {
            randomNumber2 = Int(arc4random_uniform(80)+1)
        }
        
        
        switch position {
        case 0:
            btn_ans1.setTitle(String(result), forState: .Normal)
            btn_ans2.setTitle(String(randomNumber1), forState: .Normal)
            btn_ans3.setTitle(String(randomNumber2), forState: .Normal)
            break;
        case 1:
            btn_ans2.setTitle(String(result), forState: .Normal)
            btn_ans1.setTitle(String(randomNumber1), forState: .Normal)
            btn_ans3.setTitle(String(randomNumber2), forState: .Normal)
            break;
        default:
            btn_ans3.setTitle(String(result), forState: .Normal)
            btn_ans1.setTitle(String(randomNumber1), forState: .Normal)
            btn_ans2.setTitle(String(randomNumber2), forState: .Normal)
        }
        
        
    }
    
    
    @IBAction func action_chooseAns(sender: UIButton) {
        
        var answer = Int(sender.currentTitle!)
        
        if answer == result {
            score += 1
        }
        if time >= 0 {
            setRandom()
        }
        
    }
    

}
