//
//  MainScreenViewController.swift
//  SquadGoals
//
//  Created by Khoi Nguyen on 2/21/18.
//  Copyright © 2018 Abigail Yang. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    var goalTitle: String = "No Goals Yet"
    var clicks: Double = 0
    var dayTotal: Double = 7
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var circularProgressView: KDCircularProgress!
    
    @IBOutlet weak var completeOneDay: UIButton!
    override func viewDidLoad(){
        super.viewDidLoad()
        circularProgressView.angle = 0
        if goalTitle != ""{
            titleLabel.text = goalTitle
        }
        else{
            titleLabel.text = "No Goals Yet"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func angleToDisplay() -> Double{
        return 360*(clicks / dayTotal)
    }
    
    @IBAction func increaseProgressButtonTapped(_sender: UIButton){
        if clicks != dayTotal && titleLabel.text != "No Goals Yet"  {
            clicks += 1
            let newAngleValue = angleToDisplay()
             circularProgressView.animate(toAngle: newAngleValue, duration: 0.5, completion: nil)
        }
        if angleToDisplay() == 360{
            titleLabel.text = "Finished Goal!"
        }
    }
}
