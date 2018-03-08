//
//  NewGoalViewController.swift
//  SquadGoals
//
//  Created by Khoi Nguyen on 2/28/18.
//  Copyright © 2018 Abigail Yang. All rights reserved.
//

import UIKit



class NewGoalViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet weak var numberDays: UIPickerView!
    let days = ["1","2","3","4","5","6","7"]
    var daysPicked:Double = 1
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let destination = segue.destination as? MainScreenViewController {
            destination.goalTitle = titleField.text ?? "Default"
            destination.dayTotal = daysPicked
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberDays.delegate = self
        numberDays.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return days[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(row == 0)
        {
            daysPicked = 1
        }
        else if(row == 1)
        {
            daysPicked = 2
        }
        else if(row == 2)
        {
            daysPicked = 3
        }
        else if(row == 3)
        {
            daysPicked = 4
        }
        else if(row == 4)
        {
            daysPicked = 5
        }
        else if(row == 5)
        {
            daysPicked = 6
        }
        else
        {
            daysPicked = 7
        }
    }
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
