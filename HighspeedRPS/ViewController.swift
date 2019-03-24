//
//  ViewController.swift
//  HighspeedRPS
//
//  Created by Hiroshi Matsubara on 2019/03/18.
//  Copyright © 2019 Hiroshi Matsubara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //画像保存用変数P
    //P.jpe:パー
    //R.jpg:ぐー
    //S.jpg:ちょき
    //imgArray:画像格納用配列
    var Pimg: UIImage = UIImage(named:"P.jpg")!
    var Rimg: UIImage = UIImage(named:"R.jpg")!
    var Simg: UIImage = UIImage(named:"S.jpg")!
    var Load: UIImage = UIImage(named:"icon_loader.gif")!
    var imgArray = [UIImage]()
    
    var timer : Timer!
    var startNum:Double = 0.0
    
    var oppHandNum: Int = 0
    
    var winNum: Int = 0
    
    var s :Int!
    var ms:Int!
    
    
    @IBOutlet var timeLabel:UILabel?
    @IBOutlet var startButton:UIButton?
    @IBOutlet var oppHand:UIImageView?
    @IBOutlet var pHand:UIButton?
    @IBOutlet var rHand:UIButton?
    @IBOutlet var sHand:UIButton?
    @IBOutlet var winTotal:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        timeLabel?.text = "Time: 00:00"
        winTotal?.text = "Total:0"
        imgArray.append(Pimg)
        imgArray.append(Rimg)
        imgArray.append(Simg)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "resultV" {
            
            let resultViewController = segue.destination as! ResultViewController

            resultViewController.resultN = sender as! Int
            
        }
        
        
        
    }
    
    
    
    
    @IBAction func gameStart(sender: UIButton){
        startButton?.isEnabled = false;
        
        oppHandNum = Int.random(in: 0 ... 2);
        oppHand?.image = imgArray[oppHandNum]
        
        startNum = Date().timeIntervalSince1970
        timeLabel?.text = "Total:30.00"
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
        
        
        
    }
    
    

    
    
    @objc func timerUpdate(){
        
        let elapsedTime = Date().timeIntervalSince1970 - startNum
        
        let flooredErapsedTime = Int(floor(elapsedTime))
        
        let leftTime = 30 - flooredErapsedTime
        
        let displayString = NSString(format: "%02d:%02d", leftTime) as String
        
        timeLabel?.text = "Total:" + displayString
        
        
        if (leftTime == 00){
            self.timer?.invalidate()
            
            self.performSegue(withIdentifier: "resultV",sender: winNum)
            
            
        }
        
    }
    
    @IBAction func handIsTouched(sender:UIButton){
        
        var buttonTag = sender.tag
        
        var result = (buttonTag - oppHandNum+3)%3;
        
        
        if result == 0{
            sender.isEnabled = false
        } else if result == 1{
            sender.isEnabled = false
        } else if result == 2{
            winNum = winNum+1;
            winTotal?.text = "Total: " + String(winNum);
            oppHandNum = Int.random(in: 0 ... 2);
            oppHand?.image = imgArray[oppHandNum]
            pHand?.isEnabled = true
            rHand?.isEnabled = true
            sHand?.isEnabled = true
            
        }
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
}



