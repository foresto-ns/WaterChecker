//
//  RegistrationViewController.swift
//  WaterChecker
//
//  Created by Admin on 21.04.2021.
//

import UIKit

class RegistrationViewController: UIViewController {

    var NewUser = User()
    
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var WeightField: UITextField!
    @IBOutlet weak var TargetField: UITextField!
    
    @IBAction func SaveButton(_ sender: Any) {
        let VC = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        let newName = NameField.text
        let newWeight = WeightField.text
        let newTarget = TargetField.text
        
        if newName != nil && newWeight != nil && newTarget != nil{
            NewUser.ChangeName(NewName: newName!)
            NewUser.ChangeWeigth(NewWeight: newWeight!)
            NewUser.ChangeTarget(NewTarget: newTarget!)
            VC.textFromVC = "0/\(newTarget)"
        } else {
            print("Error")
        }
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
