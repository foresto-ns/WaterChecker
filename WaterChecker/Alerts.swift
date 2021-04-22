//
//  Alerts.swift
//  WaterChecker
//
//  Created by Admin on 22.04.2021.
//

import Foundation
import UIKit

struct Alert{
    func textFieldAlert(on VC: UIViewController, with alertTitle: String, alertMessage: String, leftButtonTitle: String, rightButtonTitle: String) -> String? {
        
        let AlertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        AlertController.addTextField { (textField) in
            textField.placeholder = "250"
        }
        
        let AlertAction1 = UIAlertAction(title: leftButtonTitle, style: .default){
            (alert) in
            let newQnt = AlertController.textFields![0].text
            return newQnt
        }
        
        let AlertAction2 = UIAlertAction(title: rightButtonTitle, style: .destructive){
            (alert) in
        }
        
        AlertController.addAction(AlertAction1)
        AlertController.addAction(AlertAction2)
        
        VC.present(AlertController, animated: true, completion: nil)
        
    }
}
func textFieldAlert(<#parameters#>) -> <#return type#> {
    let AlertController = UIAlertController(title: "Добавить", message: "Введите количество выпитой воды в мл", preferredStyle: .alert)
    AlertController.addTextField { (textField) in
        textField.placeholder = "250"
    }
    
    let AlertAction1 = UIAlertAction(title: "Добавить", style: .default){
        (alert) in
        let newQnt = AlertController.textFields![0].text
        AddQnt(qnt: newQnt!)
        self.TableView.reloadData()
        
        self.ResultProgressLabel.text = String(format: "%.0f/%.0f", NewUser.getCurrentResult(), NewUser.getTarget())
        self.ResultProgressView.setProgress(Float(NewUser.getCurrentResult()/NewUser.getTarget()), animated: true)
    }
    
    let AlertAction2 = UIAlertAction(title: "Отмена", style: .destructive){
        (alert) in
    }
    
    AlertController.addAction(AlertAction1)
    AlertController.addAction(AlertAction2)
    present(AlertController, animated: true, completion: nil)
}
