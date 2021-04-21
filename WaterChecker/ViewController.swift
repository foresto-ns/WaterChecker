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
        
        AddQnt(qnt: "New qnt")
        ResultProgressLabel.text = String(format: "%.0f/%.0f", NewUser.getCurrentResult(), NewUser.getTarget())
        ResultProgressView.setProgress(Float(NewUser.getCurrentResult()/NewUser.getTarget()), animated: true)
        TableView.reloadData()
    }
    
    func update(text:String){
        ResultProgressView.alpha = 1
        ResultProgressLabel.alpha = 1
        StartLabel.alpha = 0
        
        ResultProgressLabel.text = String(format: "%.0f/%.0f", NewUser.getCurrentResult(), Double(text)!)
        
        ResultProgressView.setProgress(Float((NewUser.getCurrentResult() / Double(text)!)), animated: true)
        
        if !AddButton.self.isEnabled{
            AddButton.self.isEnabled = true
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return WaterData.count
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
        
        cell.textLabel?.text = WaterData[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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

