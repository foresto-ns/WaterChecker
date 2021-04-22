//
//  ViewController.swift
//  WaterChecker
//
//  Created by Admin on 20.04.2021.
//

import UIKit

protocol FirstViewControllerDelegate: class {
    func update(text: String)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FirstViewControllerDelegate {
    
    var textFromVC: String!
    
    @IBOutlet weak var StartLabel: UILabel!
    
    @IBOutlet weak var AddButton: UIBarButtonItem!
    
    @IBOutlet weak var ResultProgressView: UIProgressView!
    
    @IBOutlet weak var ResultProgressLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let destination = segue.destination as? RegistrationViewController else { return }
            destination.delegate = self
        }
    
    @IBAction func PushAddAction(_ sender: UIButton) {
        let AlertController = UIAlertController(title: "Добавить", message: "Введите количество выпитой воды в мл", preferredStyle: .alert)
        AlertController.addTextField { (textField) in
            textField.placeholder = "250"
        }
        
        let AlertAction1 = UIAlertAction(title: "Добавить", style: .default){ [self]
            (alert) in
            let newQnt = AlertController.textFields![0].text
            AddQnt(qnt: newQnt!)
            self.TableView.reloadData()
            
            self.ResultProgressLabel.text = String(format: "%.0f/%.0f", NewUser.getCurrentResult(), NewUser.getTarget())
            self.ResultProgressView.setProgress(Float(NewUser.getCurrentResult()/NewUser.getTarget()), animated: true)
            
            if NewUser.isTargetComplete() {
                completeTargetAlert()
            }
        }
        
        let AlertAction2 = UIAlertAction(title: "Отмена", style: .destructive){
            (alert) in
        }
        
        AlertController.addAction(AlertAction1)
        AlertController.addAction(AlertAction2)
        present(AlertController, animated: true, completion: nil)
        
    }
    
    func completeTargetAlert() {
        let AlertController = UIAlertController(title: "Поздравляем!", message: "Вы достигли своей цели!", preferredStyle: .alert)
        
        let AlertAction = UIAlertAction(title: "Ура!", style: .default){
            (alert) in
        }
        
        AlertController.addAction(AlertAction)
        self.present(AlertController, animated: true, completion: nil)
    }
    
    func update(text:String){
        ResultProgressView.alpha = 1
        ResultProgressLabel.alpha = 1
        StartLabel.alpha = 0
        
        ResultProgressLabel.text = String(format: "%.0f/%.0f", NewUser.getCurrentResult(), Double(text)!)
        
        ResultProgressView.setProgress(Float((NewUser.getCurrentResult() / Double(text)!)), animated: true)
        
        if NewUser.isTargetComplete() {
            completeTargetAlert()
        }
        
        if !AddButton.self.isEnabled{
            AddButton.self.isEnabled = true
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return NewUser.getWaterData().count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            DelQnt(atIndex: indexPath.row)	
            TableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        
        cell.textLabel?.text = NewUser.getWaterData(index: indexPath.row, key: "Time") + "\t\t-\t\t" + NewUser.getWaterData(index: indexPath.row, key: "Quantity") + " мл"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let AlertController = UIAlertController(title: "Изменить", message: "Измените количество выпитой воды в мл", preferredStyle: .alert)
        AlertController.addTextField { (textField) in
            textField.placeholder = "250"
        }
        
        let AlertAction1 = UIAlertAction(title: "Изменить", style: .default){ [self]
            (alert) in
            let newQnt = AlertController.textFields![0].text ?? NewUser.getWaterData(index: indexPath.row, key: "Quantity")
            EditQnt(at: indexPath.row, newQnt: newQnt)
            self.TableView.reloadData()
            
            self.ResultProgressLabel.text = String(format: "%.0f/%.0f", NewUser.getCurrentResult(), NewUser.getTarget())
            self.ResultProgressView.setProgress(Float(NewUser.getCurrentResult()/NewUser.getTarget()), animated: true)
            
            if NewUser.isTargetComplete() {
                completeTargetAlert()
            }
        }
        
        let AlertAction2 = UIAlertAction(title: "Отмена", style: .destructive){
            (alert) in
        }
        
        AlertController.addAction(AlertAction1)
        AlertController.addAction(AlertAction2)
        present(AlertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
            
    }

    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ResultProgressView.alpha = 0
        ResultProgressLabel.alpha = 0
        AddButton.self.isEnabled = false
        
    }

}
