//
//  RegistrationViewController.swift
//  WaterChecker
//
//  Created by Admin on 21.04.2021.
//

import UIKit

class RegistrationViewController: UIViewController {

    weak var delegate: FirstViewControllerDelegate?
    
    
    
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var WeightField: UITextField!
    @IBOutlet weak var TargetField: UITextField!
    
    @IBAction func SaveButton(_ sender: Any) {
        
        let newName = NameField.text
        let newWeight = WeightField.text
        let newTarget = TargetField.text
        
        if (newName?.count != 0 && newWeight?.count != 0 && newTarget?.count != 0 && Int(newTarget!) != nil && Int(newWeight!) != nil) {
            NewUser.ChangeName(NewName: newName!)
            NewUser.ChangeWeigth(NewWeight: newWeight!)
            NewUser.ChangeTarget(NewTarget: Int(newTarget!)!)
            delegate?.update(text: newTarget!)
        } else if Int(newWeight!) == nil{
            let AlertController = UIAlertController(title: "Некорректный ввод", message: "Используйте цифры в строке 'Вес'", preferredStyle: .alert)
            
            let AlertAction = UIAlertAction(title: "OK", style: .default){
                (alert) in
            }
            
            AlertController.addAction(AlertAction)
            present(AlertController, animated: true, completion: nil)
        
            
        }else if Int(newTarget!) == nil{
            let AlertController = UIAlertController(title: "Некорректный ввод", message: "Используйте цифры в строке 'Цели'", preferredStyle: .alert)
            
            let AlertAction = UIAlertAction(title: "OK", style: .default){
                (alert) in
            }
            
            AlertController.addAction(AlertAction)
            present(AlertController, animated: true, completion: nil)
        
            
        } else {
            let AlertController = UIAlertController(title: "Некорректный ввод", message: "Заполните все строки", preferredStyle: .alert)
            
            let AlertAction = UIAlertAction(title: "OK", style: .default){
                (alert) in
            }
            
            AlertController.addAction(AlertAction)
            present(AlertController, animated: true, completion: nil)
            
        }
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
