//
//  ViewController.swift
//  TrafficLights
//
//  Created by LIN2 on 5/28/19.
//  Copyright © 2019 LIN2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trafficImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var StartStopButton: UIButton!
    
    var startTimer = Timer()
    var scoreTimer = Timer()
    
    var timerInt = 0
    var scoreInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startGame(_ sender: Any) {
        
        if scoreInt == 0 {
            timerInt = 3
            trafficImage.image = UIImage(named: "trafficLight")
            
            startTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            scoreLabel.text = String(scoreInt)
            
            StartStopButton.isEnabled = false
            StartStopButton.setTitle("", for: UIControl.State.normal)
            
        } else {
            scoreTimer.invalidate()
            
            scoreInt = 0
            StartStopButton.setTitle("Restart", for: UIControl.State.normal)
        }
    }
    
    @objc func updateTimer() {
        timerInt -= 1
        
        if timerInt == 2 {
            trafficImage.image = UIImage(named: "trafficLight3")
        } else if timerInt  == 1 {
            trafficImage.image = UIImage(named: "trafficLight2")
        } else if timerInt == 0 {
            trafficImage.image = UIImage(named: "trafficLight1")
        }
        
        startTimer.invalidate()
        
        scoreTimer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(updateScoreTimer), userInfo: nil, repeats: true)
        StartStopButton.isEnabled = true
        StartStopButton.setTitle("Stop", for: UIControl.State.normal)
    }
    
    @objc func updateScoreTimer() {
        
        scoreInt += 1
        scoreLabel.text = String(scoreInt)
    }
    
}

