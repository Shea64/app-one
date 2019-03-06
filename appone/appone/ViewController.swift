//
//  ViewController.swift
//  appone
//
//  Created by Chapman, Emma S on 2/25/19.
//  Copyright © 2019 Chapman, Emma S. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var score: Int = 0
    var need: Int = 0
    var counter:Int = 30
    var timer = Timer()
    var isTimerRunning:Bool = false
    var chars:Int = Int(arc4random_uniform(4) + 0)
    
    @IBOutlet weak var myScore: UILabel!
    
    @IBOutlet weak var petNeed: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var petName: UITextField!
    
    @IBOutlet weak var mySubmit: UIButton!
    
    @IBOutlet weak var petImage: UIImageView!
    
    
    @IBAction func submitName(_ sender: Any) {
        let name = petName.text!
        nameLabel.text = "\(name)"
        
        petName.resignFirstResponder()
        
        chars = Int(arc4random_uniform(4) + 0)
        if isTimerRunning == false {
            runTimer()
        }
        
        petName.isHidden = true
        mySubmit.isHidden = true
        petNeed.isHidden = false
    }
    
    @IBAction func needSubmit(_ sender: Any) {
       
        petImage.image = UIImage(named: "angrypet")
        
        if (need == chars) {
            score = score + 5
            myScore.text = "Score: \(score)"
            chars = Int(arc4random_uniform(4) + 0)
            petImage.image = UIImage(named: "happypet")
        }
        else {
            // updates score w/out adding anything to score. Does not regen random number.
            myScore.text = "Score: \(score)"
        }
        
    }
    
    @IBAction func needSlider(_ sender: UISlider) {
        need = Int(sender.value)
        if (need == 0) {
            
            petNeed.setTitle("Feed", for: .normal)
        }
        else if (need == 1){
            petNeed.setTitle("Wash", for: .normal)
        }
        else if (need == 2){
            petNeed.setTitle("Pet", for: .normal)
        }
        else if (need == 3){
            petNeed.setTitle("Walk", for: .normal)
        }
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
        
    }
    
    @objc func updateTimer() {
        counter -= 1
        timerLabel.text = "\(counter)"
        if(counter == 0) {
            timerLabel.text = "Time's Up!"
            timer.invalidate()
        
        petNeed.isHidden = true
        }
    }
    
    @IBAction func myReset(_ sender: Any) {
        score = 0
        myScore.text = "Score"
        timer.invalidate()
        counter = 30
        timerLabel.text = "Timer"
        isTimerRunning = false
        petNeed.isHidden = false
        nameLabel.text = "Name your pet!"
        petName.text = ""
        petName.isHidden = false
        mySubmit.isHidden = false
        petNeed.isHidden = true
        petImage.image = UIImage(named: "happypet")
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        petNeed.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }


}

