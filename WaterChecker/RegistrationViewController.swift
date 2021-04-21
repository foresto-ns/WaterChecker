//
//  RegistrationViewController.swift
//  WaterChecker
//
//  Created by Admin on 21.04.2021.
//

import UIKit

class RegistrationViewController: UIViewController {

    weak var delegate: FirstViewControllerDelegate?
    
    var NewUser = User()
    
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var WeightField: UITextField!
    @IBOutlet weak var TargetField: UITextField!
    
    @IBAction func SaveButton(_ sender: Any) {
        
        let newName = NameField.text
        let newWeight = WeightField.text
        let newTarget = TargetField.text
        
        if newName?.count != 0 && newWeight?.count != 0 && newTarget?.count != 0 {
            NewUser.ChangeName(NewName: newName!)
            NewUser.ChangeWeigth(NewWeight: newWeight!)
            NewUser.ChangeTarget(NewTarget: newTarget!)
            delegate?.update(text: newTarget!)
        } else {
            print("Error")
        }
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
