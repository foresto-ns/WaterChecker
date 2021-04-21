//
//  Model.swift
//  WaterChecker
//
//  Created by Admin on 21.04.2021.
//

import Foundation

var WaterData: [[String: Any]] {
    set {
        UserDefaults.standard.set(WaterData, forKey: "WaterDataKey")
        UserDefaults.standard.synchronize()
    }
    get {
        if let array = UserDefaults.standard.array(forKey: "WaterDataKey") as? [[String: Any]] {
            return array
        } else {
            return []
        }
    }
}

class User {
    private var Name: String
    private var Weight: Double
    private var Target: Double
    private var CurrentResult: Double
    
    init(){
        self.Name = "Введите имя"
        self.Weight = 0
        self.Target = 0
        self.CurrentResult = 0
    }
    
    func getName() -> String {
        return self.Name
    }
    
    func getWeight()  -> Double {
        return self.Weight
    }
    
    func getTarget() -> Double {
        return self.Target
    }
    
    func getCurrentResult() -> Double {
        return self.CurrentResult
    }
    
    func ChangeName(NewName: String) {
        self.Name = NewName
    }
    
    func ChangeWeigth(NewWeight: Double) {
        self.Weight = NewWeight
    }
    
    func ChangeTarget(NewTarget: Double){
        self.Target = NewTarget
    }
    
    func ChangeCurrentResult(NewResult: Double){
        self.CurrentResult = self.CurrentResult + NewResult
    }
    
}

var NewUser = User()

func AddQnt(qnt: String) {
    
    //WaterData.append(["Quantity": qnt, "Time": time])
    NewUser.ChangeCurrentResult(NewResult: 200)
}

func DelQnt(atIndex: Int) {
    WaterData.remove(at: atIndex)
}
