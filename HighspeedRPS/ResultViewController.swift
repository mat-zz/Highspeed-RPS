//
//  ResultViewController.swift
//  HighspeedRPS
//
//  Created by Hiroshi Matsubara on 2019/03/21.
//  Copyright © 2019 Hiroshi Matsubara. All rights reserved.
//

import Foundation
import UIKit



class ResultViewController :UIViewController{
    
    var resultN: Int?
    
    var userDefaults = UserDefaults.standard
    
    var getpHighScore:Int!
    
    @IBOutlet var resultLabel:UILabel?
    @IBOutlet var highScoreLabel:UILabel?
    @IBOutlet var backButton:UIButton?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel?.text = "Result:" + String(resultN!)
        
        getpHighScore? = (userDefaults.array(forKey: "pHighScore") as! Int)
        
        highScoreLabel?.text = "HighScore:" + String(getpHighScore)
        
        
    }

    
    @IBAction func playAgain(sender: UIButton){
        
        if (getpHighScore == nil || getpHighScore < resultN!){
            
            var highScore: Int = resultN!
            
            userDefaults.set(resultN!, forKey: "pHighScore")
        }
        
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
        
        
        
    }
    

}
