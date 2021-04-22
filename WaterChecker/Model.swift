//
//  Model.swift
//  WaterChecker
//
//  Created by Admin on 21.04.2021.
//

import Foundation
//var WaterData: [[String: Any]] = []


class User {
    private var completeFlag: Bool
    private var Name: String //{
//        set {
//            UserDefaults.standard.set(newValue, forKey: "NameKey")
//            UserDefaults.standard.synchronize()
//        }
//        get {
//            if let str: String?  = UserDefaults.standard.string(forKey: "NameKey") {
//                return str!
//            } else {
//                return ""
//            }
//        }
//    }
    private var Weight: Double // {
//        set {
//            UserDefaults.standard.set(newValue, forKey: "WeightKey")
//            UserDefaults.standard.synchronize()
//        }
//        get {
//            if let double: Double?  = UserDefaults.standard.double(forKey: "WeightKey") {
//                return double!
//            } else {
//                return 0
//            }
//        }
//    }
    private var Target: Double //{
//        set {
//            UserDefaults.standard.set(newValue, forKey: "TargetKey")
//            UserDefaults.standard.synchronize()
//        }
//        get {
//            if let double: Double?  = UserDefaults.standard.double(forKey: "TargetKey") {
//                return double!
//            } else {
//                return 0
//            }
//        }
//    }
    private var CurrentResult: Double //{
//        set {
//            UserDefaults.standard.set(newValue, forKey: "CurrentResultKey")
//            UserDefaults.standard.synchronize()
//        }
//        get {
//            if let double: Double?  = UserDefaults.standard.double(forKey: "CurrentResultKey") {
//                return double!
//            } else {
//                return 0
//            }
//        }
//    }
    private var WaterData: [[String: Any]] //{
//        set {
//            UserDefaults.standard.set(newValue, forKey: "WaterDataKey")
//            UserDefaults.standard.synchronize()
//        }
//        get {
//            if let array = UserDefaults.standard.array(forKey: "WaterDataKey") as? [[String: Any]] {
//                return array
//            } else {
//                return []
//            }
//        }
//    }
    
    init() {
        self.completeFlag = false
        self.Name = "Введите имя"
        self.Weight = 0
        self.Target = 0
        self.CurrentResult = 0
        self.WaterData = []
    }
    
    func getCompleteFlag() -> Bool {
        return self.completeFlag
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
    
    func getWaterData() -> [[String: Any]] {
        return self.WaterData
    }
    func getWaterData(index: Int, key: String) -> String {
        return self.WaterData[index][key] as! String
    }
    
    func changeCompleteFlag() {
        if self.completeFlag {
            self.completeFlag = false
        } else {
            self.completeFlag = true
        }
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
    
    func AddCurrentResult(NewResult: String){
        self.CurrentResult = self.CurrentResult + Double(NewResult)!
    }
    func MinusCurrentResult(NewResult: String){
        self.CurrentResult = self.CurrentResult - Double(NewResult)!
    }
    
    func appendWaterData(array: [String: Any]){
        self.WaterData.append(array)
    }
    
    func removeWaterData(at atIndex: Int) {
        self.WaterData.remove(at: atIndex)
    }
    
    func changeWaterData(Value: String, index: Int, key: String){
        self.WaterData[index][key] = Value
    }
    
    func isTargetComplete() -> Bool {
        if(self.getCurrentResult() >= self.getTarget()) {
            return true
        } else {
            return false
        }
    }
}

var NewUser = User()

func AddQnt(qnt: String) {
    let hh = (Calendar.current.component(.hour, from: Date()))
    let mm = (Calendar.current.component(.minute, from: Date()))
    let ss = (Calendar.current.component(.second, from: Date()))
     
    let time = String(format: "%02d:%02d:%02d", hh, mm, ss)
    
    NewUser.appendWaterData(array: ["Quantity": qnt, "Time": time])
    NewUser.AddCurrentResult(NewResult: qnt)
}

func DelQnt(Index: Int) {
    let oldQnt = NewUser.getWaterData(index: Index, key: "Quantity")
    NewUser.MinusCurrentResult(NewResult: oldQnt)
    NewUser.removeWaterData(at: Index)
}

func EditQnt(at item: Int, newQnt: String){
    let oldQnt = NewUser.getWaterData(index: item, key: "Quantity")
    NewUser.MinusCurrentResult(NewResult: oldQnt)
    NewUser.changeWaterData(Value: newQnt, index: item, key: "Quantity")
    NewUser.AddCurrentResult(NewResult: newQnt)
}
