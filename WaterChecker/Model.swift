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
    var Target: Int
    var CurrentResult: Int
    
    init(){
        self.Name = "Test"
        self.Weight = "20"
        self.Target = 0
        self.CurrentResult = 0
    }
    
    func ChangeName(NewName: String) {
        self.Name = NewName
    }
    func ChangeWeigth(NewWeight: String) {
        self.Weight = NewWeight
    }
    func ChangeTarget(NewTarget: Int){
        self.Target = NewTarget
    }
    func ChangeCurrentResult(NewResult: Int){
        self.CurrentResult = self.CurrentResult + NewResult
    }
    
}

var NewUser = User()

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
