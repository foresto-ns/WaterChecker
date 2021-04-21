//
//  Model.swift
//  WaterChecker
//
//  Created by Admin on 21.04.2021.
//

import Foundation

var WaterData: [String] = []

class User {
    var Name: String
    var Weight: String
    var Target: String
    
    init(){
        self.Name = "Test"
        self.Weight = "20"
        self.Target = "0"
    }
    
    func ChangeName(NewName: String) {
        self.Name = NewName
    }
    func ChangeWeigth(NewWeight: String) {
        self.Weight = NewWeight
    }
    func ChangeTarget(NewTarget: String){
        self.Target = NewTarget
    }
    
}

func AddQnt(qnt: String) {
    WaterData.append(qnt)
    SaveData()
}

func DelQnt(atIndex: Int) {
    WaterData.remove(at: atIndex)
    SaveData()
}

func SaveData() {
    
}

func LoadData() {
    
}
