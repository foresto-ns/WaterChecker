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
    
    @IBOutlet weak var ResultProgressView: UIProgressView!
    
    @IBOutlet weak var ResultProgressLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let destination = segue.destination as? RegistrationViewController else { return }
            destination.delegate = self
        }
    
    @IBAction func PushAddAction(_ sender: Any) {
        //let str: String = 
        AddQnt(qnt: "New qnt")
        TableView.reloadData()
    }
    
    func update(text:String){
        ResultProgressLabel.text = text
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
        
        
    }


}

